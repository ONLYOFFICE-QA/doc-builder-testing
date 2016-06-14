builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

 oTable = Api.CreateTable(3, 3);
 oDocument.Push(oTable);
 oTableRow = oTable.GetRow(0);
 oCell = oTableRow.GetCell(1);
 oCell.SetNoWrap(true);
 oCellContent = oCell.GetContent();
 oParagraph = oCellContent.GetElement(0);
 oParagraph.AddText("No wrap");

 
builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_nowrap.docx");
builder.CloseFile();

