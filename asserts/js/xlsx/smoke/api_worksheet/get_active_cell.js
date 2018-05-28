builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2:D7");
oWorksheet.ActiveCell.Value = "Value in active cell";
builder.SaveFile("xlsx", "GetCol.xlsx");
builder.CloseFile();
