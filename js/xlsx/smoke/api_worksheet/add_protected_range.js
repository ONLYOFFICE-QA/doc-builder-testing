builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
oWorksheet.GetRange("B1").SetValue("2");
oWorksheet.AddProtectedRange("protectedRange", "Sheet1!$A$1:$B$1");
builder.SaveFile("xlsx", "ProtectedRange.xlsx");
builder.CloseFile();
