builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetName("sheet 1");
oWorksheet.GetRange("A1").Value = oWorksheet.GetName();
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();
