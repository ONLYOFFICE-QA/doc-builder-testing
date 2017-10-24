builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oNumbering = oDocument.CreateNumbering("numbered");
for (var nLvl = 0; nLvl < 8; ++nLvl)
{
	oNumLvl = oNumbering.GetLevel(nLvl);
	var sFormatString = "";
	for (var nTempLvl = 0; nTempLvl <= nLvl; ++nTempLvl)
		sFormatString += "%" + nTempLvl + ".";
	oNumLvl.SetCustomType("lowerRoman", sFormatString, "left");
	oNumLvl.SetStart(nLvl + 1);
	oNumLvl.SetSuff("space");
	oParagraph = Api.CreateParagraph();
	oParagraph.AddText("Custom numbered lvl " + (nLvl + 1));
	oParagraph.SetNumbering(oNumLvl);
	oParagraph.SetContextualSpacing(true);
	oDocument.Push(oParagraph);
	oParagraph = Api.CreateParagraph();
	oParagraph.AddText("Custom numbered lvl " + (nLvl + 1));
	oParagraph.SetNumbering(oNumLvl);
	oParagraph.SetContextualSpacing(true);
	oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "SetCustomType.docx");
builder.CloseFile();
