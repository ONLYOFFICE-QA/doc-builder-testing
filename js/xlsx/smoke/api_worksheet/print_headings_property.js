builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.PrintHeadings = true;
oWorksheet.GetRange("A1").SetValue(oWorksheet.PrintHeadings);
builder.SaveFile("xlsx", "PrintHeadings.xlsx");
builder.CloseFile();
