builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;
    
 oTable = Api.CreateTable(3, 3);
 oDocument.Push(oTable);
 oTable.SetShd("clear", 255, 0, 0);

builder.SaveFile("docx", "table_with_background.docx");
builder.CloseFile();
