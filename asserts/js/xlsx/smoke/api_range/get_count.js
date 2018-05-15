builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var count = oWorksheet.GetRange('A1:C3').GetCount();
oWorksheet.GetRange('A1').SetValue(count);
builder.SaveFile("xlsx", "SetCount.xlsx");
builder.CloseFile();
