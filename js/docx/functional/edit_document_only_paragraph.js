builder.OpenFile("assets/sample_files/only_paragraph.docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.SetJc("center");
oParagraph.AddText("Center");
builder.SaveFile("docx", "only_paragraph.docx");
builder.CloseFile();
