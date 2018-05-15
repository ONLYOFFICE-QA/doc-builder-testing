builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetCols('A').SetHidden(true);
var hidden_status = oWorksheet.GetCols('A').GetHidden();
oWorksheet.GetRange('A1').SetValue(hidden_status);
builder.SaveFile("xlsx", "GetHidden.xlsx");
builder.CloseFile();
