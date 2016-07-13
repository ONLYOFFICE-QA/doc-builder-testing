builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTable;
oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableBorderTop("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderBottom("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderLeft("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderRight("single", 32, 0, 0, 0, 255);
oTable.SetTableBorderInsideV("single", 32, 0, 255, 0, 0);
oTable.SetTableBorderInsideH("single", 32, 0, 255, 0, 0);
oTable.SetWidth("percent", 100);
builder.SaveFile("docx", "CreateTable.docx");
builder.CloseFile();
                        