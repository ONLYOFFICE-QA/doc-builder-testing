builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.PrintGridlines = false;
oWorksheet.GetRange("A1").SetValue(oWorksheet.PrintGridlines);
builder.SaveFile("xlsx", "PrintGridlines.xlsx");
builder.CloseFile();
