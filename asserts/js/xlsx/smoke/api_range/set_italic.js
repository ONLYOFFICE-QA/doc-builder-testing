builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("Italicized text");
oWorksheet.GetRange("A2").SetItalic(true);
oWorksheet.GetRange("A3").SetValue("Normal text");
builder.SaveFile("xlsx", "SetBold.xlsx");
builder.CloseFile();