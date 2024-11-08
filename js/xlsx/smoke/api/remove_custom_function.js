builder.CreateFile("xlsx");
/**
 * Calculates the sum of the specified numbers.
 * @customfunction
 * @returns {number} The sum of the numbers.
 */
Api.AddCustomFunction(function add(first, second) {
    return first + second;
});

var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("=add(1, 2)");
Api.RemoveCustomFunction("add");
oWorksheet.GetRange("A2").SetValue("=add(1, 2)");
builder.SaveFile("xlsx", "RemoveCustomFunction.xlsx");
builder.CloseFile();
