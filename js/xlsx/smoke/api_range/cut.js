builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A1");
oRange.SetValue("Text which is cut from A1 and pasted to A2");
oRange.Cut(oWorksheet.GetRange("A2"));
builder.SaveFile("xlsx", "Cut.xlsx");
builder.CloseFile();
