builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
var a = 2;
oRun.AddText("Numbers: " + 1 + " " + a + " " + 1.999999999999999 + " " + 1.99999999999999999);
oParagraph.AddElement(oRun);

oRun = Api.CreateRun();
oRun.AddText("If 1 / 0 : " + 1 / 0 );
oParagraph.AddElement(oRun);

oRun = Api.CreateRun();
oRun.AddText("String" *  5);
oParagraph.AddElement(oRun);

oRun = Api.CreateRun();
oRun.AddText("hex 0xFF (to be eq 255) :" +  0xFF);
oParagraph.AddElement(oRun);

oRun = Api.CreateRun();
oRun.AddText("scientific format 3e5 (to be eq 300000) :" +  3e5);
oParagraph.AddElement(oRun);

builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();
