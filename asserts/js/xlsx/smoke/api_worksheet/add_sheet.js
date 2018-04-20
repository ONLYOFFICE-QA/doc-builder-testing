builder.CreateFile("xlsx");
var oWorkBook = Api.GetActiveWorkbook();
oWorkBook.AddSheet('new_sheet_name');
builder.SaveFile("xlsx", "AddSheet.xlsx");
builder.CloseFile();