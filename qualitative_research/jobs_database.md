# Jobs Database
## Automatic Hierarcy
1. Open the Apps Script editor by clicking on "Extensions" and selecting "Apps Script."
2. In the script editor, replace any existing code with the following:
```javascript
function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Custom Functions')
    .addItem('Update Hierarchy Count', 'updateHierarchyCount')
    .addToUi();
}

function updateHierarchyCount() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = sheet.getDataRange().getValues();
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
    sheet.getRange(1, 2, outputData.length, 1).setValues(outputData);
  }
}

function getLevel(cellValue) {
  if (cellValue === "") {
    return 0;
  }
  var match = cellValue.match(/Level (\d+):/);
  return match ? parseInt(match[1]) : 0;
}

function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Custom Functions')
    .addItem('Update Hierarchy Count', 'updateHierarchyCount')
    .addToUi();
}
```
3. Save the script.

4. Close the Apps Script tab.

5. Refresh your Google Sheet.

6. You should now see a "Custom Functions" menu. Click on it, and you should see the "Update Hierarchy Count" option.

7. Click on "Update Hierarchy Count" to run the script.
