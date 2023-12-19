builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetName("My Custom Table Style");
    let oTableRowPr = oTableStyle.GetTableRowPr();
        oTableRowPr.SetHeight("atLeast", 720);
    let jsonTableRowPr = oTableRowPr.ToJSON();
        GlobalVariable["JSON_TableRowPr"] = jsonTableRowPr;
builder.CloseFile();

//////////////

builder.CreateFile("docx");
    let oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    let jsonTableRowPr = GlobalVariable["JSON_TableRowPr"];
    let savedTableRowPr = JSON.parse(jsonTableRowPr);
    let oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetName("My Custom Table Style");
    let oTable = Api.CreateTable(3, 3);
        oTable.SetStyle(oTableStyle);
    for (let i = 0; i < oTable.GetRowsCount(); i++) {
        let oRow = oTable.GetRow(i);
        oRow.SetHeight(savedTableRowPr.trHeight.hRule, savedTableRowPr.trHeight.val);
    }
    let jsonTable = oTable.ToJSON();
        oParagraph.AddText(jsonTable);
builder.SaveFile("docx", "CustomTableWithJSON.docx");
builder.CloseFile();
