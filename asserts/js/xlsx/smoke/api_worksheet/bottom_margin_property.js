builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.BottomMargin = 50;
oWorksheet.GetRange("A1").SetValue(oWorksheet.BottomMargin);
builder.SaveFile("xlsx", "BottomMargin.xlsx");
builder.CloseFile();
