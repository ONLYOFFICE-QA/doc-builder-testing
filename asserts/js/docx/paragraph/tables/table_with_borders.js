builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableBorderTop("single", 8, 0, 1, 2, 3);
oTable.SetTableBorderBottom("single", 16, 0, 4, 5, 6);
oTable.SetTableBorderLeft("single", 24, 0, 7, 8, 9);
oTable.SetTableBorderRight("single", 32, 0, 10, 11, 12);
oTable.SetTableBorderInsideV("single", 40, 0, 13, 14, 15);
oTable.SetTableBorderInsideH("single", 48, 0, 16, 17, 18);
builder.SaveFile("docx", "table_with_borders.docx");
builder.CloseFile();

