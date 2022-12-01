builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable, oTableRow, oCell;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(1);
oCell.SetShd("clear", 255, 0, 0);
oTableRow = oTable.GetRow(1);
oCell = oTableRow.GetCell(0);
oCell.SetCellBorderTop("single", 32, 0, 0, 255, 0);
oCell.SetCellBorderBottom("single", 64, 0, 0, 255, 0);
oCell.SetCellBorderLeft("single", 32, 0, 0, 0, 255);
oCell.SetCellBorderRight("single", 16, 0, 0, 0, 255);
builder.SaveFile("docx", "table_with_cell_borders.docx");
builder.CloseFile();

