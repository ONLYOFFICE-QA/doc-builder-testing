builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRows('1').SetFillColor(Api.CreateColorFromRGB(255, 224, 204));
builder.SaveFile("xlsx", "SetFillColor.xlsx");
builder.CloseFile();