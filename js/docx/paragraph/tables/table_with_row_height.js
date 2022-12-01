builder.CreateFile("docx");
var oDocument, oTable, oTableRow;
oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTableRow = oTable.GetRow(0);
oTableRow.SetHeight("auto");
oTableRow = oTable.GetRow(1);
oTableRow.SetHeight("atLeast", 1000);
oTableRow = oTable.GetRow(2);
oTableRow.SetHeight("atLeast", 2000);
builder.SaveFile("docx", "table_with_row_height.docx");
builder.CloseFile();

