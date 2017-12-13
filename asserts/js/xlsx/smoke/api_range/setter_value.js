builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('B1').Value = '2';
oWorksheet.GetRange('B2').Value = '2';
oWorksheet.GetRange('A3').Value = '2x2=';
oWorksheet.GetRange('B3').Value = '=B1*B2';
builder.SaveFile("xlsx", "SetValue.xlsx");
builder.CloseFile();
