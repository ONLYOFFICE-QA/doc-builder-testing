builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

var oTableStyle = oDocument.GetStyle("Bordered & Lined - Accent 1");
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetStyle(oTableStyle);
oTable.SetTableLook(false, false, true, true, false, true);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_styleparametres.docx");
builder.CloseFile();
