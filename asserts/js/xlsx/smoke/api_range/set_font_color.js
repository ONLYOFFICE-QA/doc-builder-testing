builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontColor(0, 255, 0);
builder.SaveFile("xlsx", "SetFontColor.xlsx");
builder.CloseFile();