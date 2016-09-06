builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A2').SetValue('2'); 
var sRange = oWorksheet.GetRange("A1:D5");
sRange.SetFontName("Arial");
builder.SaveFile("xlsx", "SetFontName.xlsx");
builder.CloseFile();