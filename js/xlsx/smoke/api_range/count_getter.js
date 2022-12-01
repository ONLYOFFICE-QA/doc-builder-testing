builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var count = oWorksheet.GetRange('A1:C3').Count;
oWorksheet.GetRange('A1').SetValue(count);
builder.SaveFile("xlsx", "SetCount.xlsx");
builder.CloseFile();
