builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNumbering = oDocument.CreateNumbering("bullet");
var oNumLvl;
for (var nLvl = 0; nLvl  8; ++nLvl)
{
    oNumLvl = oNumbering.GetLevel(nLvl);
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Default numbered lvl " + (nLvl + 1));
    oParagraph.SetNumbering(oNumLvl);
    oParagraph.SetContextualSpacing(true);
    oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "CreateNumbering.docx");
builder.CloseFile();
            