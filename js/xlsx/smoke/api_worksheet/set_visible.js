builder.CreateFile("xlsx");
Api.AddSheet('new_sheet');
var Sheets = Api.GetSheets();
Sheets[0].SetVisible(false);
builder.SaveFile("xlsx", "SetVisible.xlsx");
builder.CloseFile();
