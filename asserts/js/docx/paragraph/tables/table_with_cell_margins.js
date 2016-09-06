builder.CreateFile("docx");
var oDocument, oTable, oTableRow, oCell;
oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(1);
oCell.SetCellMarginBottom(300);
oCell.SetCellMarginLeft(100);
oCell.SetCellMarginRight(null);
oCell.SetCellMarginTop(400);
builder.SaveFile("docx", "table_with_cell_margins.docx");
builder.CloseFile();

