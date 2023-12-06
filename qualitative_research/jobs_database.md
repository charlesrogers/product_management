# Jobs Database
## How to Automatically Number Your Jobs
It's easier to have distinct, relational, names names for each job level. The following formula will create those for you in Google Sheets.

1. Open the Apps Script editor by clicking on "Extensions" and selecting "Apps Script."
2. In the script editor, replace any existing code with the following:
```javascript
// Version 2.8 - Improved numbering logic to continue from the last non-blank row in the output column

function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Custom Functions')
    .addItem('Update Hierarchy Count', 'promptAndRunUpdate')
    .addToUi();
}

function promptAndRunUpdate() {
  var ui = SpreadsheetApp.getUi();
  var result = ui.prompt('Enter Data Column Letter', 'Enter the letter of the column containing the data to READ for hierarchy counts (e.g., B)', ui.ButtonSet.OK_CANCEL);

  if (result.getSelectedButton() === ui.Button.OK) {
    var dataColumnLetter = result.getResponseText().toUpperCase();
    if (/^[A-Z]$/.test(dataColumnLetter)) {
      result = ui.prompt('Enter Result Column Letter', 'Enter the letter of the column where you want to WRITE the hierarchical numbering system (e.g., A)', ui.ButtonSet.OK_CANCEL);

      if (result.getSelectedButton() === ui.Button.OK) {
        var resultColumnLetter = result.getResponseText().toUpperCase();
        if (/^[A-Z]$/.test(resultColumnLetter)) {
          updateHierarchyCount(dataColumnLetter, resultColumnLetter);
        } else {
          ui.alert('Invalid column letter. Please enter a single uppercase letter (A-Z) for the result column.');
        }
      }
    } else {
      ui.alert('Invalid column letter. Please enter a single uppercase letter (A-Z) for the data column.');
    }
  }
}

function updateHierarchyCount(dataColumnLetter, resultColumnLetter) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = sheet.getRange(dataColumnLetter + "1:" + dataColumnLetter + sheet.getLastRow()).getValues();
  var outputData = [];
  var outputRowIndex = getLastNonBlankRowIndex(sheet, resultColumnLetter) + 1; // Start from the next row

  for (var i = 1; i < data.length; i++) {
    var level = getLevel(data[i][0]);
    if (level > 0) {
      var currentCount = getCurrentCount(outputData, level);
      currentCount[level - 1]++;
      for (var j = level; j < currentCount.length; j++) {
        currentCount[j] = 0;
      }
      var countString = currentCount.map(val => (val || "0")).join(".");
      outputData.push([countString]);
      outputRowIndex++;
    } else {
      // If the input column doesn't contain the "Level" pattern, do not overwrite the output column
      outputData.push([outputRowIndex <= sheet.getLastRow() ? sheet.getRange(outputRowIndex, sheet.getRange(resultColumnLetter + "1").getColumn()).getValue() || "" : ""]);
      outputRowIndex++;
    }
  }

  // Write the hierarchy counts to the specified result column starting from the specified row
  sheet.getRange(outputRowIndex - outputData.length, sheet.getRange(resultColumnLetter + "1").getColumn(), outputData.length, 1).setValues(outputData);
}

function getLevel(cellValue) {
  if (cellValue === "") {
    return 0;
  }
  var match = cellValue.match(/Level (\d+):/);
  return match ? parseInt(match[1]) : 0;
}

function getCurrentCount(outputData, level) {
  var currentCount = Array(level).fill(0);
  if (outputData.length > 0) {
    var lastCount = outputData[outputData.length - 1][0].split(".").map(Number);
    currentCount = currentCount.map((val, index) => lastCount[index] || 0);
  }
  return currentCount;
}

function getLastNonBlankRowIndex(sheet, columnLetter) {
  var values = sheet.getRange(columnLetter + "1:" + columnLetter + sheet.getLastRow()).getValues();
  for (var i = values.length - 1; i >= 0; i--) {
    if (values[i][0] !== "") {
      return i + 1; // Adjust for 1-based index
    }
  }
  return 0; // Return 0 if the column is completely blank
}

```
3. Save the script.

4. Close the Apps Script tab.

5. Refresh your Google Sheet.

6. You should now see a "Custom Functions" menu. Click on it, and you should see the "Update Hierarchy Count" option.

7. Click on "Update Hierarchy Count" to run the script.
*NB:* When you run the script, you will be prompted for user inputs twice, the first asking in which column are your Job Levels, and the second, to which column you wish to write your numbering system.
