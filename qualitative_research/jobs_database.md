# Jobs Database
## Automatic Hierarcy
It's easier to have distinct, relational, names names for each level. The following formula will create those for you.

*NB:* When you run the script, you will be prompted twice, the first asking which column has your Job Levels, and the second, to which column you want to write your numbering system.

1. Open the Apps Script editor by clicking on "Extensions" and selecting "Apps Script."
2. In the script editor, replace any existing code with the following:
```javascript
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
      result = ui.prompt('Enter Result Column Letter', 'Enter the letter of the column where you want to WRITE the hierarchal numbering system (e.g., A)', ui.ButtonSet.OK_CANCEL);

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
  var currentCount = [0, 0, 0, 0];
  var outputData = [];

  for (var i = 0; i < data.length; i++) {
    if (data[i][0] !== "") {
      var level = getLevel(data[i][0]);
      if (level > 0) {
        currentCount[level - 1]++;
        for (var j = level; j < currentCount.length; j++) {
          currentCount[j] = 0;
        }
        var countString = currentCount.slice(0, level).join(".");
        outputData.push([countString]);
      }
    }
  }

  if (outputData.length > 0) {
    // Write the hierarchy counts to the specified result column
    sheet.getRange(1, sheet.getRange(resultColumnLetter + "1").getColumn(), outputData.length, 1).setValues(outputData);
  }
}

function getLevel(cellValue) {
  if (cellValue === "") {
    return 0;
  }
  var match = cellValue.match(/Level (\d+):/);
  return match ? parseInt(match[1]) : 0;
}
```
3. Save the script.

4. Close the Apps Script tab.

5. Refresh your Google Sheet.

6. You should now see a "Custom Functions" menu. Click on it, and you should see the "Update Hierarchy Count" option.

7. Click on "Update Hierarchy Count" to run the script.
