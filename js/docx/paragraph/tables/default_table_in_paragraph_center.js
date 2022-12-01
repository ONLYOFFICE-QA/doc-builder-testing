builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetJc("center");
builder.SaveFile("docx", "default_table_in_paragraph_center.docx");
builder.CloseFile();
