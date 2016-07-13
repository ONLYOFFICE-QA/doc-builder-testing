builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and add the inside vertical 4 point red borders:");
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetTableBorderTop("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderBottom("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderLeft("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderRight("single", 4, 0, 0, 0, 255);
oTable.SetTableBorderInsideV("single", 32, 0, 255, 0, 0);
oTable.SetTableBorderInsideH("single", 4, 0, 255, 0, 0);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableBorderInsideV.docx");
builder.CloseFile();
            