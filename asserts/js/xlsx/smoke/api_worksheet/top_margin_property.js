builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.TopMargin = 50;
oWorksheet.GetRange("A1").SetValue(oWorksheet.TopMargin);
builder.SaveFile("xlsx", "TopMargin.xlsx");
builder.CloseFile();
