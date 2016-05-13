builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oSection1, oParagraph1, oParagraph2, oTable1, oTable2;

oParagraph1 = Api.CreateParagraph();
oTable1 = Api.CreateTable(3, 3);
oDocument.Push(oTable1);
oSection1 = oDocument.CreateSection(oParagraph1);
oDocument.Push(oParagraph1);

oParagraph2 = Api.CreateParagraph();
oTable2 = Api.CreateTable(3, 3);
oDocument.Push(oTable2);
oDocument.Push(oParagraph2);

builder.SaveFile("docx", "/home/pc/Documents/temp_docx/table_in_section.docx");
builder.CloseFile();