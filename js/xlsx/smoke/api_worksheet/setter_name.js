builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.Name = "sheet 1";
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();
