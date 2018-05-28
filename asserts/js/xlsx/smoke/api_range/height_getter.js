builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRows('1').SetRowHeight(30);
var height = oWorksheet.GetRows('1').Height;
oWorksheet.GetRange('A1').SetValue(height);
builder.SaveFile("xlsx", "HeightGetter.xlsx");
builder.CloseFile();
