builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetLeftMargin(50);
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetLeftMargin());
builder.SaveFile("xlsx", "GetLeftMargin.xlsx");
builder.CloseFile();
