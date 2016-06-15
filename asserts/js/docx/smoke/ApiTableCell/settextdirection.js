
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 1440);
oCell = oTable.GetRow(0).GetCell(0);
oCell.SetTextDirection("btlr");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("btlr");
oCell = oTable.GetRow(0).GetCell(1);
oCell.SetTextDirection("tbrl");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("tbrl");
oCell = oTable.GetRow(1).GetCell(0);
oCell.SetTextDirection("lrtb");
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("lrtb");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTextDirection.docx");
builder.CloseFile();
            