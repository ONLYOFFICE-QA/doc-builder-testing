builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRows('1').SetRowHeight(30);
var height = oWorksheet.GetRows('1').RowHeight;
oWorksheet.GetRange('A1').SetValue(height);
builder.SaveFile("xlsx", "RowHeightGetter.xlsx");
builder.CloseFile();
