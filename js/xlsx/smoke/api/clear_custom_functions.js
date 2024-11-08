builder.CreateFile("xlsx");
/**
 * Calculates the sum of the specified numbers.
 * @customfunction
 * @returns {number} The sum of the numbers.
 */
Api.AddCustomFunction(function SUM(first, second) {
    return first + second;
});

/**
 * Calculates the difference of the specified numbers.
 * @customfunction
 * @returns {number} The sum of the numbers.
 */
Api.AddCustomFunction(function DIFF(first, second) {
    return first - second;
});

var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("=SUM(1, 2)");
oWorksheet.GetRange("B1").SetValue("=DIFF(2, 1)");
Api.ClearCustomFunctions();
oWorksheet.GetRange("A2").SetValue("=SUM(1, 2)");
oWorksheet.GetRange("B2").SetValue("=DIFF(2, 1)");
builder.SaveFile("xlsx", "ClearCustomFunctions.xlsx");
builder.CloseFile();
