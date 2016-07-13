builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumLvl, oNumbering, oNumbering1;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first element of a numbered list");
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oNumbering1 = oParagraph.GetNumbering();
oNumLvl = oNumbering.GetLevel(0);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second element of a numbered list");
oParagraph.SetNumbering(oNumLvl);
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetNumbering.docx");
builder.CloseFile();
            