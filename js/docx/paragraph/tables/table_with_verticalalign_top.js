builder.CreateFile("docx");
var oDocument, oParagraph, oTable, oTableRow, oCell, oCellContent;
oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(0);
oCell.SetVerticalAlign("top");
oCellContent = oCell.GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("Top");
builder.SaveFile("docx", "table_with_verticalalign_top.docx");
builder.CloseFile();

