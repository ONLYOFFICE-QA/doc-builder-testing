builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A1:A2').ForEach(function (cell) {
    cell.SetFillColor(Api.CreateColorFromRGB(255, 224, 204))});
builder.SaveFile("xlsx", "ForEach.xlsx");
builder.CloseFile();
