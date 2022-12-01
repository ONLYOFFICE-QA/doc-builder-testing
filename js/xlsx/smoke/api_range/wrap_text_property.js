builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("This is the text to show SetWrap");
oWorksheet.GetRange("A2").WrapText = true;
oWorksheet.GetRange("C2").SetValue("This is the text to show no wrap");
oWorksheet.GetRange("C2").WrapText = false;
builder.SaveFile("xlsx", "SetWrap.xlsx");
builder.CloseFile();
