builder.CreateFile("docx");Error
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText("StartRows" + oTable.GetRowsCount() + "StartColumns");
oTableRow = oTable.AddRow(oTable.GetRow(1).GetCell(0), true);
oTableRow.GetCell(0).GetContent().GetElement(0).AddText("NewRow");
builder.SaveFile("docx", "table_add_row_in_position.docx");
builder.CloseFile();

