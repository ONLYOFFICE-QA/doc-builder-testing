builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark 1");
oDocument.GetRange(14, 22).AddBookmark("Bookmark 2");

let aBookmarks = oDocument.GetAllBookmarksNames();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Bookmark names: " + aBookmarks.join(", "));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetAllBookmarksNames.docx");
builder.CloseFile();
