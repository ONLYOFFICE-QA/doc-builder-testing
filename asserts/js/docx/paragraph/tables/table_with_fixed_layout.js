builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;
    
  oTable = Api.CreateTable(3, 3);
  oDocument.Push(oTable);
  oTable.SetTableLayout("fixed")

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_fixed_layout.docx");
builder.CloseFile();
