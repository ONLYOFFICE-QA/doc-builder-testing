builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Rows.Bold = true;
builder.SaveFile("xlsx", "ColsGetter.xlsx");
builder.CloseFile();