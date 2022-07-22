builder.CreateFile("xlsx");
Api.AddSheet('New sheet');
Api.GetSheet('Sheet1').Delete();
builder.SaveFile("xlsx", "DeleteSheet.xlsx");
builder.CloseFile();
