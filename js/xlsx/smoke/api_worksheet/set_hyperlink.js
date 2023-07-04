builder.CreateFile("xlsx");
        Api.AddSheet("Sheet2");
    let ws2 = Api.GetSheet("Sheet2")
        ws2.SetHyperlink("A1", "", "Sheet1!A1", "SheetName!Range", "format")
        ws2.SetHyperlink("B2", "", "Sheet1!C3:D5", "SheetName!Range:Range", "format")
        ws2.SetHyperlink("C3", "https://google.com", "google", "google.com")
builder.SaveFile("xlsx", "SetHyperlink.xlsx");
builder.CloseFile();
