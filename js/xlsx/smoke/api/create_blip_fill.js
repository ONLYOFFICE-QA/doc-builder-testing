builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFill, oStroke;
oFill = Api.CreateBlipFill("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/icon_DocumentEditors.png", "tile");
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oWorksheet.AddShape("flowChartOnlineStorage", 60 * 36000, 35 * 36000, oFill, oStroke, 0, 2 * 36000, 1, 3 * 36000);
builder.SaveFile("xlsx", "CreateBlipFill.xlsx");
builder.CloseFile();
