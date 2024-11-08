builder.CreateFile("xlsx");
/**
 * Calculates the sum of the specified numbers.
 * @customfunction
 * @nameLocale {ru: Добавить | fr:Ajouter | es:Añadir}
 * @param {number} first The first number
 * @param {number} [second] The second number
 * @returns {number} The sum of the numbers.
 */
Api.AddCustomFunction (function ADD (first, second) {
    if (second === null) {
        second = 0;
    }
    return first + second;
});

var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("=add(1,2)");
builder.SaveFile("xlsx", "AddCustomFunctionWithSpaces.xlsx");
builder.CloseFile();
