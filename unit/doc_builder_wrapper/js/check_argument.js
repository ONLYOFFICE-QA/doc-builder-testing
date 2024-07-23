builder.CreateFile("docx");
var oArgument = Argument;
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Argument: " + JSON.stringify(oArgument));
builder.SaveFile("docx", "ArgumentUse.docx");
builder.CloseFile();
