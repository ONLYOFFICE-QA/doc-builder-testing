builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.PageOrientation = "xlLandscape";
oWorksheet.GetRange("A1").SetValue(oWorksheet.PageOrientation);
builder.SaveFile("pdf", "PageOrientation.pdf");
builder.CloseFile();
