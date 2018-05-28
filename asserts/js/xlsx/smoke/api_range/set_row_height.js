builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRows(1).SetRowHeight(15);
builder.SaveFile("xlsx", "SetRowHeight.xlsx");
builder.CloseFile(); 
