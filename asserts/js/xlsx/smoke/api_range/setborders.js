builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetColumnWidth(0, 50);
oWorksheet.GetRange("A2").SetBorders("Bottom", "Thick", Api.CreateColorFromRGB(49, 133, 154));
oWorksheet.GetRange("A2").SetValue("This is a cell with a bottom border");
builder.SaveFile("xlsx", "SetBorders.xlsx");
builder.CloseFile();