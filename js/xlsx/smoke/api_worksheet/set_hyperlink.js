builder.CreateFile("xlsx");
        Api.AddSheet('Sheet2');
    let ws = Api.GetSheet(1)
        ws.SetHyperlink("A1", "https://google.com", "gooogle", "help");
        ws.SetHyperlink("A2", "", "Sheet1!A1", "gooogle", "help");
        ws.SetHyperlink("A3", "", "Sheet1!A1:B2", "gooogle", "help");
builder.SaveFile("xlsx", "SetHyperlink.xlsx")
builder.CloseFile();
