builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oDocument.AddMathEquation("dx/dy", "unicode")
oParagraph.AddLineBreak().MoveCursorToPos(1);
oDocument.AddMathEquation("dx/dy", "latex")
builder.SaveFile("docx", "AddMathEquation.docx");
builder.CloseFile();
