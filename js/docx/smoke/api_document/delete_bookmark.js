builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 9).AddBookmark("Bookmark");

let result = oDocument.DeleteBookmark("Bookmark");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Delete result: " + result + ", GetBookmark result: " + oDocument.GetBookmark("Bookmark"));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetAllBookmarksNames.docx");
builder.CloseFile();
