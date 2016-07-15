builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(2);
oCell = oTableRow.GetCell(0);
oCell.SetTextDirection("lrtb");
oCellContent = oCell.GetContent();
oParagraph = oCellContent.GetElement(0);
oParagraph.AddText("left to right");
 
builder.SaveFile("docx", "table_with_textdirection_ltr.docx");
builder.CloseFile();

