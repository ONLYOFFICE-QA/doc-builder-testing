builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark");

let oBookmark = oDocument.GetBookmark("Bookmark");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Bookmark name: " + oBookmark.GetName() + ", text: " + oBookmark.GetText());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetBookmark.docx");
builder.CloseFile();
