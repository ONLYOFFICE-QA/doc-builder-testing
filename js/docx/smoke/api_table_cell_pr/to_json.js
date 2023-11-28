builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
    var json = oTableStyle.ToJSON();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
GlobalVariable["tableStyleJSON"] = json
builder.CloseFile();

/////////////


builder.CreateFile("docx");
    var oNewDocument = Api.GetDocument();
    let oParagraph = oNewDocument.GetElement(0);
    var jsonTableStyle = GlobalVariable["tableStyleJSON"];
    var oTableStyleFromJSON = Api.FromJSON(jsonTableStyle);
        oParagraph.AddText(jsonTableStyle);
        oNewDocument.Push(oParagraph);
        oNewDocument.Push(oTableStyleFromJSON);
builder.SaveFile("docx", "TableCellToJSON.docx");
builder.CloseFile();
