builder.OpenFile("assets/sample_files/only_paragraph.docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oRun = oParagraph.GetElement(0);
oRun.SetColor(0, 0, 255);
builder.SaveFile("docx", "only_paragraph.docx");
builder.CloseFile();
