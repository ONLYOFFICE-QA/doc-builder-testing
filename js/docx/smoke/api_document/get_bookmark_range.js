builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark");

oParagraph = Api.CreateParagraph();
let oRange = oDocument.GetBookmarkRange("Bookmark");
oRange.SetBold(true);
builder.SaveFile("docx", "GetBookmarkRange.docx");
builder.CloseFile();
