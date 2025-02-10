builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(21, 28).AddBookmark("BookmarkName");

let oBookmark = oDocument.GetBookmark("BookmarkName");
oBookmark.GoTo();
oParagraph = Api.CreateParagraph();
oParagraph.AddText(oDocument.GetCurrentWord());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GoTo.docx");
builder.CloseFile();
