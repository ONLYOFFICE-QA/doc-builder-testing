builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark 1");
oDocument.GetRange(14, 22).AddBookmark("Bookmark 2");

oDocument.GetBookmark("Bookmark 1").Delete();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("All bookmarks: " + oDocument.GetAllBookmarksNames() + ", deleted GetBookmark: " + oDocument.GetBookmark("Bookmark 1"));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "Delete.docx");
builder.CloseFile();
