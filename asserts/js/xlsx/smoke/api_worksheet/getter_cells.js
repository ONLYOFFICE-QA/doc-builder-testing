builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Cells.WrapText = true;
builder.SaveFile("xlsx", "GetterCells.xlsx");
builder.CloseFile();
