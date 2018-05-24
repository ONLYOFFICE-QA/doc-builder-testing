builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetPageOrientation());
builder.SaveFile("xlsx", "GetPageOrientation.xlsx");
builder.CloseFile();
