builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("auto");
oTableRow = oTable.GetRow(1);
oTableRow.SetHeight("atLeast", 1000);
oTableRow = oTable.GetRow(2);
oTableRow.SetHeight("atLeast", 2000)

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_row_height.docx");
builder.CloseFile();

