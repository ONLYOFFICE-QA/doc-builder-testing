builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetShd("clear", 255, 0, 0);
builder.SaveFile("docx", "table_with_background.docx");
builder.CloseFile();
