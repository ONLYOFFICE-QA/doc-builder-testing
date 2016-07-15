builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

    oTable = Api.CreateTable(5, 5);
    oDocument.Push(oTable);
    oCell = oTable.MergeCells([oTable.GetRow(1).GetCell(1), oTable.GetRow(1).GetCell(2), oTable.GetRow(2).GetCell(1), oTable.GetRow(2).GetCell(2)]);
    oCell.GetContent().GetElement(0).AddText("Merged cell");
 
builder.SaveFile("docx", "table_with_merge.docx");
builder.CloseFile();

