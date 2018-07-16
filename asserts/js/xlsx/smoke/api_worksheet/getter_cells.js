builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Cells.SetFillColor(Api.CreateColorFromRGB(255, 224, 204));
builder.SaveFile("xlsx", "GetterCells.xlsx");
builder.CloseFile();
