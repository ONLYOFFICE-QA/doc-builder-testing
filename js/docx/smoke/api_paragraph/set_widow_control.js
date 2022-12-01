builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
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
for (var i = 0; i < 4; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetWidowControl(true);
oParagraph.AddText("This last line is displayed on the next page, because we used the set widow control method set to 'true'.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetWidowControl.docx");
builder.CloseFile();
