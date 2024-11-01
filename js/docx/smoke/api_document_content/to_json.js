builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
    var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
    var oDrawing = Api.CreateShape("rect", 3212465, 963295, oFill, oStroke);
        oParagraph.AddDrawing(oDrawing);
    var oDocContent = oDrawing.GetDocContent();
// Add Hyperlink
        oParagraph = oDocContent.GetElement(0);
        oParagraph.AddText('Hyperlink');
    var oRange = oParagraph.GetRange(0, 10);
        oRange.AddHyperlink('https://legacy-api.onlyoffice.com')
// Add BlockLvlSdt
    var oBlockLvlSdt = Api.CreateBlockLvlSdt();
        oBlockLvlSdt.AddText('oBlockLvlSdt');
        oDocContent.Push(oBlockLvlSdt);
// Add Table
    var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
    var oTable = Api.CreateTable(3, 3);
    var oCell = oTable.GetCell(0, 0);
        oCell.GetContent().GetElement(0).AddText("Cell #1");
        oTable.SetWidth("percent", 100);
        oTable.SetStyle(oTableStyle);
        oDocContent.Push(oTable);
    var json = oDocContent.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var oDocContentFromJSON = Api.FromJSON(json);
    var oDocument = Api.GetDocument();
    var arrElements = []
    for( var i = 0; i < oDocContentFromJSON.GetElementsCount(); i++) {
        arrElements.push(oDocContentFromJSON.GetElement(i));
    }
        oDocument.InsertContent(arrElements)
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "DocContentToJSON.docx");
builder.CloseFile();
