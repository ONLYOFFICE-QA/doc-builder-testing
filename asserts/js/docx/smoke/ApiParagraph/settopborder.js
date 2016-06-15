
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a thick green border above it.");
oParagraph.SetTopBorder("single", 24, 0, 0, 255, 0);
builder.SaveFile("docx", "SetTopBorder.docx");
builder.CloseFile();
            