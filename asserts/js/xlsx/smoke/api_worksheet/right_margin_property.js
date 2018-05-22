builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.RightMargin = 50;
oWorksheet.GetRange("A1").SetValue(oWorksheet.RightMargin);
builder.SaveFile("xlsx", "RightMargin.xlsx");
builder.CloseFile();
