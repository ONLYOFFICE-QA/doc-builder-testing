builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetCols('A').SetColumnWidth(15);
var width = oWorksheet.GetCols('A').Width;
oWorksheet.GetRange('A1').SetValue(width);
builder.SaveFile("xlsx", "WidthGetter.xlsx");
builder.CloseFile();
