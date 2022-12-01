builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableLayout("fixed");
builder.SaveFile("docx", "table_with_fixed_layout.docx");
builder.CloseFile();
