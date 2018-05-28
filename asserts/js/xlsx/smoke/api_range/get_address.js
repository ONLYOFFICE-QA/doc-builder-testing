builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var range = oWorksheet.GetRange('A1');
range.SetValue(range.GetAddress());
builder.SaveFile("xlsx", "GetAddress.xlsx");
builder.CloseFile();
