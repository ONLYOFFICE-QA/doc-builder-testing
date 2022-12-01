builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetWidth("auto");
builder.SaveFile("docx", "table_with_width_auto.docx");
builder.CloseFile();
