builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetTopMargin(50);
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetTopMargin());
builder.SaveFile("xlsx", "TopMargin.xlsx");
builder.CloseFile();
