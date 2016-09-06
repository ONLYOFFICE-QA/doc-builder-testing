builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetJc("right");
builder.SaveFile("docx", "default_table_in_paragraph_right.docx");
builder.CloseFile();