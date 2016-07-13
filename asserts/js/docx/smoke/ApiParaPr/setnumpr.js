builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr, oNumbering;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oNumbering = oDocument.CreateNumbering("bullet");
oParaPr.SetNumPr(oNumbering);
var oNumLvl;
for (var nLvl = 0; nLvl  8; ++nLvl)
{
oNumLvl = oNumbering.GetLevel(nLvl);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
}
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is a paragraph styled as a bulleted list.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetNumPr.docx");
builder.CloseFile();
