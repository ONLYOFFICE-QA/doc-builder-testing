builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.AddImage("https://static.onlyoffice.com/assets/docs/samples/img/presentation_sky.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 0, 3 * 36000);
builder.SaveFile("xlsx", "AddImage.xlsx");
builder.CloseFile();
