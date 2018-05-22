builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetBottomMargin(50);
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetBottomMargin());
builder.SaveFile("xlsx", "BottomMargin.xlsx");
builder.CloseFile();
