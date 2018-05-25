builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue(oWorksheet.Selection.Count);
builder.SaveFile("xlsx", "Selection.xlsx");
builder.CloseFile();
