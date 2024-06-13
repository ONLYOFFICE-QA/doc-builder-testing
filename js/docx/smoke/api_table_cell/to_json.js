builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oTable = Api.CreateTable(3, 3);
    var oCell = oTable.GetCell(0,0);
        oCell.SetCellBorderBottom("single", 32, 0, 51, 51, 51)
        oCell.SetCellBorderLeft("single", 32, 0, 51, 51, 51)
        oCell.SetCellBorderRight("single", 32, 0, 51, 51, 51)
        oCell.SetCellBorderTop("single", 32, 0, 51, 51, 51)
        oCell.SetCellMarginBottom(720);
        oCell.SetCellMarginLeft(720);
        oCell.SetCellMarginRight(720);
        oCell.SetCellMarginTop(720);
        oCell.SetBackgroundColor(255, 111, 61, false);
        oCell.SetShd("clear", 255, 111, 61, false);
        oCell.SetTextDirection("btlr");
        oCell.SetWidth("twips", 2880);
        oTable.SetWidth("percent", 100);
    var json = oCell.ToJSON();
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var oCellPr = Api.FromJSON(json);
    var oDocument = Api.GetDocument();
    var oTable = Api.CreateTable(3, 3);
        oTable.GetCell(0,0).SetCellPr(oCellPr)
        oTable.SetWidth("percent", 100);
        oDocument.Push(oTable);
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();
