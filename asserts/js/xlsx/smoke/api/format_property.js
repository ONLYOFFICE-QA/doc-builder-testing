builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('A1').SetValue('|' + Api.Format('17:04:23', "hh:mm:ss AM/PM") + '|');
builder.SaveFile("xlsx", "Format.xlsx");
builder.CloseFile();
