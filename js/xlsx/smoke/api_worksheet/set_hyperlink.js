builder.CreateFile("xlsx");
Api.AddSheet("Sheet2");
let ws2 = Api.GetSheet("Sheet2")
ws2.SetHyperlink("A1", "https://google.com", "", "google.com")
ws2.SetHyperlink("B1", "Sheet1!A1", "Sheet1!A1", "Sheet1 A1", "SheetName!Range")
ws2.SetHyperlink("C1", "Sheet1!C3:D5", "Sheet1!C3:D5", "Sheet1 C3:D5", "SheetName!Range:Range")
ws2.SetHyperlink("D1", "A2", "A2", "Sheet2 A2", "Range")
ws2.SetHyperlink("E1", "C3:D5", "C3:D5", "Sheet2 C3:D5", "Range:Range")
builder.SaveFile("xlsx", "SetHyperlink.xlsx");
builder.CloseFile();
