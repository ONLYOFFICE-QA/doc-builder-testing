builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
Api.AddSheet('new_sheet_name');
var index = Api.GetSheets()[1].GetIndex();
oWorksheet.GetRange('A1').SetValue(index);
builder.SaveFile("xlsx", "AddSheet.xlsx");
builder.CloseFile();