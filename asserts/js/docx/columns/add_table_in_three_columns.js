builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection, oTable1, oTable2, oParagraph1, oParagraph2, oParagraph3;

oParagraph1 = Api.CreateParagraph();
oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(3, 720);
oTable1 = Api.CreateTable(3, 3);
oDocument.Push(oTable1);
oParagraph1.AddColumnBreak();
oDocument.Push(oParagraph1);

oParagraph2 = Api.CreateParagraph();
oTable2 = Api.CreateTable(3, 3);
oDocument.Push(oTable2);
oParagraph2.AddColumnBreak();
oDocument.Push(oParagraph2);

oParagraph3 = Api.CreateParagraph();
oTable3 = Api.CreateTable(3, 3);
oDocument.Push(oTable3);
oDocument.Push(oParagraph3);

builder.SaveFile("docx", "add_table_in_three_columns.docx");
builder.CloseFile();