builder.CreateFile("xlsx");
Api.AddSheet('new_sheet');
var Sheets = Api.GetSheets();
Sheets[0].SetVisible(false);
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue(Sheets[0].GetVisible());
Sheets[0].GetVisible();
builder.SaveFile("xlsx", "SetVisible.xlsx");
builder.CloseFile();
