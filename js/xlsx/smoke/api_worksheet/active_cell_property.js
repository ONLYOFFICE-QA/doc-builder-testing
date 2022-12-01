builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.ActiveCell.SetValue('Text');
builder.SaveFile("xlsx", "ActiveCell.xlsx");
builder.CloseFile();
