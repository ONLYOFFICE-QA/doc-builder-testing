builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFill, oStroke;
oFill = Api.CreatePatternFill("dashDnDiag", Api.CreateRGBColor(255, 224, 204), Api.CreateRGBColor(255, 164, 101));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreatePatternFill.xlsx");
builder.CloseFile();
