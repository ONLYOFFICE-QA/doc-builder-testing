builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetName("My Custom Table Style");
    let oTableRowPr = oTableStyle.GetTableRowPr();
        oTableRowPr.SetHeight("atLeast", 720);
    let jsonTableStyle = oTableStyle.ToJSON();
        GlobalVariable["JSON_TableStyle"] = jsonTableStyle;
        oParagraph.AddText(jsonTableStyle);
builder.CloseFile();

//////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let jsonTableStyle = GlobalVariable["JSON_TableStyle"];
        oParagraph.AddText(jsonTableStyle);
    let oTableStyle = oDocument.GetStyle("My Custom Table Style");
    let oTable = Api.CreateTable(3, 3);
        oTable.SetStyle(oTableStyle);
        oDocument.Push(oTable);
    let jsonTable = oTableStyle.ToJSON();
    let oParagraph2 = Api.CreateParagraph();
        oDocument.Push(oParagraph2);
        oParagraph2.AddText(jsonTable);
builder.SaveFile("docx", "TableStyleToJSON.docx");
builder.CloseFile();
