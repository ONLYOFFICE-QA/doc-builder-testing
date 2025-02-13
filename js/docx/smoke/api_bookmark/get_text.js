builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(12, 20).AddBookmark("BookmarkName");

oParagraph = Api.CreateParagraph();
oParagraph.AddText("Bookmark text: " + oDocument.GetBookmark("BookmarkName").GetText());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetText.docx");
builder.CloseFile();
