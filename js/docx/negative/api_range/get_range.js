builder.CreateFile("docx");
var oArgument = Argument;
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Document Builder check GetRange method");
var oRange1 = oDocument.GetRange(oArgument['start_pos'], oArgument['end_pos']);
oRange1.SetBold(true);
builder.SaveFile("docx", "GetRange.docx");
builder.CloseFile();
