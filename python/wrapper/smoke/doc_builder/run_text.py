from python.docbuilder import builder
builder.CreateFile("docx")
builder.RunText("""var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph for RunText");
oDocument.Push(oParagraph);
""")
builder.SaveFile("docx", "Run.docx")
builder.CloseFile()
