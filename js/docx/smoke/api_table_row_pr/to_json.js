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
    let oTableStyle = Api.FromJSON(jsonTableStyle);
    let oTable = Api.CreateTable(3, 3);
        oTable.SetStyle(oTableStyle);
    let jsonTable = oTableStyle.ToJSON();
    let oParagraph2 = Api.CreateParagraph();
        oParagraph2.AddText(jsonTable);
        oDocument.Push(oParagraph2);
builder.SaveFile("docx", "TableStyleToJSON.docx");
builder.CloseFile();
