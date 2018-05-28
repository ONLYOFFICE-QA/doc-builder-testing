builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var range = oWorksheet.GetRange("A1");
range.SetOffset(3, 1);
range.SetValue("Text");
builder.SaveFile("xlsx", "SetOffset.xlsx");
builder.CloseFile();
