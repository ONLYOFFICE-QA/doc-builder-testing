builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetCols('A').SetColumnWidth(15);
var width = oWorksheet.GetCols('A').GetColumnWidth();
oWorksheet.GetRange('A1').SetValue(width);
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();
