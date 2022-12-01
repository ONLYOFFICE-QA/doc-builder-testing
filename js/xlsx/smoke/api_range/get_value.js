builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("Inserted text");
var value = oWorksheet.GetRange("A2").GetValue();
oWorksheet.GetRange("A3").SetValue(value);
builder.SaveFile("xlsx", "GetValue.xlsx");
builder.CloseFile();
