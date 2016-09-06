builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetName("sheet 1");
builder.SaveFile("xlsx", "SetName.xlsx");
builder.CloseFile();