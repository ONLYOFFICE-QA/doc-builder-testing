builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

  oTable = Api.CreateTable(3, 3);
  oDocument.Push(oTable);
  oTableRow = oTable.GetRow(0);
  oCell = oTableRow.GetCell(1);
  oCell.SetCellMarginBottom(300);
  oCell.SetCellMarginLeft(100);
  oCell.SetCellMarginRight(null);
  oCell.SetCellMarginTop(400);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_cell_margins.docx");
builder.CloseFile();

