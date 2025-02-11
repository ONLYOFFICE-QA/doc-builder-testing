builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(12, 20).AddBookmark("BookmarkName");

let oBookmark = oDocument.GetBookmark("BookmarkName");
oBookmark.SetText("Bookmark SetText");
builder.SaveFile("docx", "SetText.docx");
builder.CloseFile();
