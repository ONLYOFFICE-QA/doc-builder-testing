builder.CreateFile("xlsx");
oWorksheet = Api.GetActiveSheet();
oRange = oWorksheet.GetRange("A1:C1");
oRange.SetValue("1");
oRange.Select();
Api.GetSelection().SetValue("selected");
builder.SaveFile("xlsx", "Select.xlsx");
builder.CloseFile();
