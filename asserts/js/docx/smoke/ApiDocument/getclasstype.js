builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = Api.CreateParagraph();
var oClassType = oDocument.GetClassType();
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Class Type = " + oClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();
