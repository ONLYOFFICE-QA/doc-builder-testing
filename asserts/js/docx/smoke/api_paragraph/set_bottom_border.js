builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a thin red border below it.");
oParagraph.SetBottomBorder("single", 8, 0, 255, 0, 0);
builder.SaveFile("docx", "SetBottomBorder.docx");
builder.CloseFile();
