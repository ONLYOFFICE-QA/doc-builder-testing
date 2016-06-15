
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetBetweenBorder("single", 24, 0, 0, 255, 0);
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the first paragraph. ");
oParagraph.AddText("The paragraph properties styled above set a border between paragraphs.");
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the second paragraph. ");
oParagraph.AddText("No need to add anything additionally to it. ");
oParagraph.AddText("The borders between the paragraphs have already been set.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the third paragraph. ");
oParagraph.AddText("No need to add anything additionally to it. ");
oParagraph.AddText("The borders between the paragraphs have already been set.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetBetweenBorder.docx");
builder.CloseFile();
            