builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var TStyleName = "List Table 5 Dark"
        // "Grid Table 1 Light"
        // "List Table 1 Light"
        // "Lined Accent"
        // "Bordered - Accent 5"
    var oTableStyle = oDocument.GetStyle(TStyleName);
    var oTable = Api.CreateTable(3, 3);
        oTable.SetStyle(oTableStyle);
    var json = oTable.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oPar = oDocument.GetElement(0);
    var json = GlobalVariable["JSON"]
        oPar.AddText(json);
    var oTableFromJSON = Api.FromJSON(json);
    oDocument.Push(oTableFromJSON);
builder.SaveFile("docx", "TableToJSON.docx");
builder.CloseFile();
