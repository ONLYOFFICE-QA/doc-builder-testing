builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetCols('A').SetHidden(true);
builder.SaveFile("xlsx", "SetHidden.xlsx");
builder.CloseFile();
