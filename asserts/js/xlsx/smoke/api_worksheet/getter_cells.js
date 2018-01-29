builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Cells.SetFillColor(Api.CreateColorFromRGB(255, 224, 204));
builder.SaveFile("xlsx", "GetCells.xlsx");
builder.CloseFile();
