builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRows(1).SetRowHeight(15);
var height = oWorksheet.GetRows(1).GetRowHeight();
oWorksheet.GetRange('A1').SetValue(height);
builder.SaveFile("xlsx", "GetRowHeight.xlsx");
builder.CloseFile(); 
