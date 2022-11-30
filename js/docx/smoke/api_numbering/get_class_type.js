builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNumbering = oDocument.CreateNumbering("bullet");
var oNumLvl;
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
oNumLvl = oNumbering.GetLevel(nLvl);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
}
var oClassType = oNumbering.GetClassType();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Class Type = " + oClassType);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();
