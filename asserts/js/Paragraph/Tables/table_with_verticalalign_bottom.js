Api.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oCell = oTableRow.GetCell(0);
oCell.SetVerticalAlign("bottom");
oCellContent = oCell.GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("Bottom");
 
Api.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_with_verticalalign_bottom.docx");
Api.CloseFile();

