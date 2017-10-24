builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var sRange = oWorksheet.GetRange("A1:D5");
oWorksheet.GetRange('A2').SetValue('2'); 
sRange.SetAlignVertical("top");
builder.SaveFile("xlsx", "SetAlignVertical.xlsx");
builder.CloseFile();
