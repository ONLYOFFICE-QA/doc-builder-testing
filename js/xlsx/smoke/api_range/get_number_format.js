builder.CreateFile("xlsx");
var ws = Api.GetActiveSheet();
ws.SetColumnWidth(0, 30);
ws.SetColumnWidth(1, 30);
ws.SetColumnWidth(2, 30);
ws.GetRange("A2").SetNumberFormat("General");
ws.GetRange("A2").SetValue("123456");
ws.GetRange("B2").SetValue("General");
ws.GetRange("A3").SetNumberFormat("0.00");
ws.GetRange("A3").SetValue("123456");
ws.GetRange("B3").SetValue("Number");
ws.GetRange("A4").SetNumberFormat("$#,##0.00");
ws.GetRange("A4").SetValue("123456");
ws.GetRange("B4").SetValue("Currency");
ws.GetRange("A5").SetNumberFormat("_($* #,##0.00_)");
ws.GetRange("A5").SetValue("123456");
ws.GetRange("B5").SetValue("Accounting");
ws.GetRange("A6").SetNumberFormat("m/d/yyyy");
ws.GetRange("A6").SetValue("123456");
ws.GetRange("B6").SetValue("DateShort");
ws.GetRange("A7").SetNumberFormat("[$-F800]dddd, mmmm dd, yyyy");
ws.GetRange("A7").SetValue("123456");
ws.GetRange("B7").SetValue("DateLong");
ws.GetRange("A8").SetNumberFormat("[$-F400]h:mm:ss AM/PM");
ws.GetRange("A8").SetValue("123456");
ws.GetRange("B8").SetValue("Time");
ws.GetRange("A9").SetNumberFormat("0.00%");
ws.GetRange("A9").SetValue("123456");
ws.GetRange("B9").SetValue("Percentage");
ws.GetRange("A10").SetNumberFormat("0%");
ws.GetRange("A10").SetValue("123456");
ws.GetRange("B10").SetValue("Percent");
ws.GetRange("A11").SetNumberFormat("# ?/?");
ws.GetRange("A11").SetValue("123456");
ws.GetRange("B11").SetValue("Fraction");
ws.GetRange("A12").SetNumberFormat("0.00E+00");
ws.GetRange("A12").SetValue("123456");
ws.GetRange("B12").SetValue("Scientific");
ws.GetRange("A13").SetNumberFormat("@");
ws.GetRange("A13").SetValue("123456");
ws.GetRange("B13").SetValue("Text");
for (let i = 2; i <= 13; i++) {
    const [A,C] = [1,3];
    let range = ws.GetCells(i, A);
    ws.GetCells(i, C)
        .SetValue('123456')
    ws.GetCells(i, C)
        .SetNumberFormat(range.GetNumberFormat())
}
builder.SaveFile("xlsx", "GetNumberFormat");
builder.CloseFile();
