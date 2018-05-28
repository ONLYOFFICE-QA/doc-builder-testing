builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetRightMargin(50);
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetRightMargin());
builder.SaveFile("xlsx", "RightMargin.xlsx");
builder.CloseFile();
