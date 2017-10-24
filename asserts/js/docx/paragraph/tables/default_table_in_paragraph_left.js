builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetJc("left");
builder.SaveFile("docx", "default_table_in_paragraph_left.docx");
builder.CloseFile();
