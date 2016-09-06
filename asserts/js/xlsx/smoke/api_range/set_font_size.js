builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontSize(20);
builder.SaveFile("xlsx", "SetFontSize.xlsx");
builder.CloseFile();