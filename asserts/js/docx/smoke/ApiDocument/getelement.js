
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oSection = oDocument.GetFinalSection();
var oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is the text in the default header");
builder.SaveFile("docx", "GetElement.docx");
builder.CloseFile();
            