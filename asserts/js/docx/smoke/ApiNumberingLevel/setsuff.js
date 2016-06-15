
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumLvl, oNumbering;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl.SetCustomType("decimalZero", "repeating text %1", "left");
oNumLvl.SetSuff("space");
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a numbered list using custom text with numbering");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of a numbered list using custom text with numbering");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSuff.docx");
builder.CloseFile();
            