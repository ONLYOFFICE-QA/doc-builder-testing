builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableInd(1000);
oTable.SetTableCellMarginBottom(200);
oTable.SetTableCellMarginTop(100);
oTable.SetTableCellMarginLeft(400);
oTable.SetTableCellMarginRight(200);
oTable.SetCellSpacing(200);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_margins.docx");
builder.CloseFile();

