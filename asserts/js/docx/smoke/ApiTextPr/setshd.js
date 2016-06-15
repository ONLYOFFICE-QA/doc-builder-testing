
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetShd("clear", 0, 255, 0);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the shading set to green.");
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();
            