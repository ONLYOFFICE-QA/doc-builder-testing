builder.CreateFile("docx");
var oDocument, oParagraph, oTable, oTableRow, oCell, oCellContent;
oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(1);
oCell.SetNoWrap(true);
oCellContent = oCell.GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("No wrap");
builder.SaveFile("docx", "table_with_nowrap.docx");
builder.CloseFile();

