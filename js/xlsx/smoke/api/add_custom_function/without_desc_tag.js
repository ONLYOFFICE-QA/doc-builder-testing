builder.CreateFile("xlsx");
/**
 * Calculates the sum of the specified numbers.
 * @returns {number} The sum of the numbers.
 */
Api.AddCustomFunction(function add(first, second) {
    return first + second;
});

var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("=ADD(1,2)");
builder.SaveFile("xlsx", "AddCustomFunctionBase.xlsx");
builder.CloseFile();
