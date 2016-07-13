builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableCellPr;
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("atLeast", 1440);
oTableCellPr = oTableStyle.GetTableCellPr();
oTableCellPr.SetVerticalAlign("bottom");
oCell = oTable.GetRow(0).GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
oParagraph.AddText("Align bottom");
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetVerticalAlign.docx");
builder.CloseFile();
            