builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.LeftMargin = 50;
oWorksheet.GetRange("A1").SetValue(oWorksheet.LeftMargin);
builder.SaveFile("xlsx", "LeftMargin.xlsx");
builder.CloseFile();
