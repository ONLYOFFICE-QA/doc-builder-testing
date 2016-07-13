builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetLanguage("en-CA");
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the language set to English (Canada) using the text properties.");
builder.SaveFile("docx", "SetLanguage.docx");
builder.CloseFile();
            