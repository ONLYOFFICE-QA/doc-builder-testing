
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oHeader;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a page with a header. ");
oParagraph.AddText("See it above.");
var oSection = oDocument.GetFinalSection();
oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("This is a page header");
builder.SaveFile("docx", "GetHeader.docx");
builder.CloseFile();
            