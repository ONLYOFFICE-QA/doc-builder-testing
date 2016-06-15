
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun, oTextPr;
var MyNewRunStyle = oDocument.CreateStyle("My New Run Style", "run");
oTextPr = MyNewRunStyle.GetTextPr();
oTextPr.SetCaps(true);
oTextPr.SetFontFamily("Calibri Light");
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oRun.AddText("The text properties are changed and the style is added to the paragraph. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetStyle(MyNewRunStyle);
oRun.AddText("This is a text run with its own style.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();
            