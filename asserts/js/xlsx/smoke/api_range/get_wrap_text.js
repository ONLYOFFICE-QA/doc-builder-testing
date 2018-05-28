builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("Text");
oWorksheet.GetRange("A1").WrapText = true;
var wrap_text = oWorksheet.GetRange("A2").GetWrapText();
oWorksheet.GetRange("A2").SetValue(wrap_text);
builder.SaveFile("xlsx", "GetWrapText.xlsx");
builder.CloseFile();
