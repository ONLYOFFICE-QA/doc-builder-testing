builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection, oParagraph1, oParagraph2, oParagraph2;

oParagraph1 = Api.CreateParagraph();
oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(3, 720);
oParagraph1.AddText("First columns");
oParagraph1.AddColumnBreak();
oDocument.Push(oParagraph1);

oParagraph2 = Api.CreateParagraph();
oParagraph2.AddText("Second columns");
oDocument.Push(oParagraph2);

oParagraph3 = Api.CreateParagraph();
oParagraph3.AddText("Third columns");
oDocument.Push(oParagraph3);

builder.SaveFile("docx", "add_three_columns.docx");
builder.CloseFile();