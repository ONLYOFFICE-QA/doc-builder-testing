builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetName("sheet 1");
oWorksheet.GetRange("A1").SetValue("Value");
builder.SaveFile("xlsx", "AddTextToSell.xlsx");
builder.CloseFile();