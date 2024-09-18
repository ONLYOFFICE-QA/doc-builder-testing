from python.docbuilder import builder
builder.CreateFile("docx")
result = builder.RunText("""
var oDocument = Api.GetDocument();
var oParagraph = Api.GetParagraph(0);
""")
builder.SaveFile("docx", "IsError.docx")
builder.CloseFile()
