builder.CreateFile("docx");
// oParagraph
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddText("paragraph");
        oDocument.Push(oParagraph);

// oTable
    var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
    var oTable = Api.CreateTable(3, 3);
        oTable.SetWidth("percent", 100);
        oTable.SetTableDescription("Empty table");
        oTable.SetStyle(oTableStyle);
    var oCell = oTable.GetCell(0, 0);
        oCell.GetContent().GetElement(0).AddText(oTable.GetClassType());
        oDocument.Push(oTable);

// oBlockLvlSdt
    var oBlockLvlSdt = Api.CreateBlockLvlSdt();
        oBlockLvlSdt.GetContent().GetElement(0).AddText(oBlockLvlSdt.GetClassType());
        oParagraph = Api.CreateParagraph();
        oParagraph.AddText("This is a block text content control.");
        oBlockLvlSdt.Push(oParagraph);
        oDocument.Push(oBlockLvlSdt)

    var bWriteDefaultTextPr	= false
    // Specifies if the default text properties will be written to the JSON object or not.
    var bWriteDefaultParaPr	= false
    // Specifies if the default paragraph properties will be written to the JSON object or not.
    var bWriteTheme	= false
    // Specifies if the document theme will be written to the JSON object or not.
    var bWriteSectionPr = false
    // Specifies if the document section properties will be written to the JSON object or not.
    var bWriteNumberings = false
    // Specifies if the document numberings will be written to the JSON object or not.
    var bWriteStyles = false
    // Specifies if the document styles will be written to the JSON object or not.

    var json = oDocument.ToJSON(bWriteDefaultTextPr,
        bWriteDefaultParaPr,
        bWriteTheme,
        bWriteSectionPr,
        bWriteNumberings,
        bWriteStyles);

GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"];
    var oDocumentFromJSON = Api.FromJSON(json);
    var oDocument = Api.GetDocument();
        oDocument.GetElement(0).AddText(json);
        oDocument.Push(oDocumentFromJSON[1]);
        oDocument.Push(oDocumentFromJSON[2]);
        oDocument.Push(oDocumentFromJSON[4]);
builder.SaveFile("docx", "DocumentToJSON.docx");
builder.CloseFile();
