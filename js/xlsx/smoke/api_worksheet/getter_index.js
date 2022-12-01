builder.CreateFile("xlsx");
Api.AddSheet('new_sheet_name');
var oWorksheets = Api.GetSheets();
var index_1 = oWorksheets[0].Index;
var index_2 = oWorksheets[1].Index;
oWorksheets[0].GetRange('A1').SetValue(index_1);
oWorksheets[0].GetRange('A2').SetValue(index_2);
builder.SaveFile("xlsx", "GetterIndex.xlsx");
builder.CloseFile();
