builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("This is the text to show SetWrapText");
oWorksheet.GetRange("A2").SetWrapText(true);
oWorksheet.GetRange("C2").SetValue("This is the text to show no wrap");
oWorksheet.GetRange("C2").SetWrapText(false);
builder.SaveFile("xlsx", "SetWrapText.xlsx");
builder.CloseFile();
