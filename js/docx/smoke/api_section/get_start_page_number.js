builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a section");
let oSection = oDocument.GetFinalSection();
let oHeader = oSection.GetHeader("default", true);
oParagraph = oHeader.GetElement(0);
oParagraph.AddText("GetStartPageNumber: " + oSection.GetStartPageNumber());

oSection.SetStartPageNumber(3);
let oFooter = oSection.GetFooter("default", true);
oParagraph = oFooter.GetElement(0);
oParagraph.AddText("GetStartPageNumber: " + oSection.GetStartPageNumber());
builder.SaveFile("docx", "GetStartPageNumber.docx");
builder.CloseFile();
