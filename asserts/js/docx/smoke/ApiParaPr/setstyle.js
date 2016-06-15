
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oHeading6Style = oDocument.GetStyle("Heading 6");
oParaPr = oHeading6Style.GetParaPr();
oParaPr.SetStyle(oHeading6Style);
oParaPr.SetJc("center");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading6Style);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();
            