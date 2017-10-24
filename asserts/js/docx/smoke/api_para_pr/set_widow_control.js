builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetWidowControl(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The single line of the last paragraph on this page will be prevented from being displayed on a separate page. ");
for (var x = 0; x < 5; ++x)
{
    oParagraph = Api.CreateParagraph();
    for (var i = 0; i < 10; ++i)
    {
        oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
    }
    oDocument.Push(oParagraph);
}
oParagraph = Api.CreateParagraph();
for (var i = 0; i < 3; ++i)
{
    oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This last line would be displayed on the next page, if we had not used the set widow control method.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetWidowControl.docx");
builder.CloseFile();
