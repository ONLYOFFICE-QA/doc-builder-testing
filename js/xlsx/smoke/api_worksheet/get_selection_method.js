builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue(oWorksheet.GetSelection().Count);
builder.SaveFile("xlsx", "Selection.xlsx");
builder.CloseFile();
