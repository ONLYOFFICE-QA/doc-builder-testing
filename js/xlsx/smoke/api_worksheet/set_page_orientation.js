builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetPageOrientation("xlLandscape");
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetPageOrientation());
builder.SaveFile("pdf", "SetPageOrientation.pdf");
builder.CloseFile();
