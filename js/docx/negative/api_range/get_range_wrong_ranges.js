builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Document Builder check GetRange method");
var oRange1 = oDocument.GetRange({start_pos}, {end_pos});
oRange1.SetBold(true);
builder.SaveFile("docx", "GetRange.docx");
builder.CloseFile();
