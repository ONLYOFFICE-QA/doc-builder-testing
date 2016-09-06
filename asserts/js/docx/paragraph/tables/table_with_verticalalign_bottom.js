builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oParagraph, oTable, oTableRow, oCell, oCellContent;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(0);
oCell.SetVerticalAlign("bottom");
oCellContent = oCell.GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("Bottom");
builder.SaveFile("docx", "table_with_verticalalign_bottom.docx");
builder.CloseFile();

