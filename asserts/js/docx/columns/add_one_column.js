builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection, oParagraph;

oParagraph = Api.CreateParagraph();
oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(1, 720);
oParagraph.AddText("First columns");
oDocument.Push(oParagraph);

builder.SaveFile("docx", "add_one_column.docx");
builder.CloseFile();