builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oSection1, oParagraph1, oParagraph2, oFinalSection;

oParagraph = Api.CreateParagraph();
oSection = oDocument.CreateSection(oParagraph);
oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetPageSize(12240, 15840);
oDocument.Push(oParagraph);

builder.SaveFile("docx", "page_size_for_section.docx");
builder.CloseFile();