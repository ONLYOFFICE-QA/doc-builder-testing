builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Cols.Bold = true;
builder.SaveFile("xlsx", "ColsGetter.xlsx");
builder.CloseFile();
