builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
function print_hello_word() {
    oRun.AddText("Hello Word");
}
function print_hello_word_not_used() {
    oRun.AddText("Hello Word not used");
}
print_hello_word();
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();
