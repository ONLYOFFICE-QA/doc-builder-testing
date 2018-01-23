builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.AlignHorizontal = "center";
builder.SaveFile("xlsx", "SetAlignHorizontal.xlsx");
builder.CloseFile();
