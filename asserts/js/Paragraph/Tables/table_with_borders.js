builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

 oTable = Api.CreateTable(3, 3);
 oDocument.Push(oTable);
 oTable.SetTableBorderTop("single", 32, 0, 0, 0, 0);
 oTable.SetTableBorderBottom("single", 32, 0, 0, 0, 0);
 oTable.SetTableBorderLeft("single", 32, 0, 0, 0, 0);
 oTable.SetTableBorderRight("single", 32, 0, 0, 0, 0);
 oTable.SetTableBorderInsideV("single", 32, 0, 0, 0, 0);
 oTable.SetTableBorderInsideH("single", 32, 0, 0, 0, 0);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_borders.docx");
builder.CloseFile();

