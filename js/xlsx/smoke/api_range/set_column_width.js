builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetCols('A').SetColumnWidth(15);
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();
