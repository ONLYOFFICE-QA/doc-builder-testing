builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetJc("left");
builder.SaveFile("docx", "default_table_in_paragraph.docx");
builder.CloseFile();
