builder.CreateFile("xlsx");
Api.AddSheet('new_sheet_name');
builder.SaveFile("xlsx", "AddSheet.xlsx");
builder.CloseFile();