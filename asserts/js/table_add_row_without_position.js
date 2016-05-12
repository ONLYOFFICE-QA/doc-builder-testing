builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

 oTable = Api.CreateTable(3, 3);
 oDocument.Push(oTable);
 oTable.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText("StartRows" + oTable.GetRowsCount() + "StartColumns");
 oTableRow = oTable.AddRow();
 oTableRow.GetCell(0).GetContent().GetElement(0).AddText("NewRow");
 
builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/table_add_row_without_position.docx");
builder.CloseFile();

