builder.CreateFile("docx");
let sOldName = "Bookmark_A";
let sNewName = "Bookmark_B";
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark(sOldName);

let oBookmark = oDocument.GetBookmark(sOldName);
oBookmark.SetName(sNewName);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Bookmark by old name: " + oDocument.GetBookmark(sOldName) + ", by new name: " + oDocument.GetBookmark(sNewName).GetName());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetName.docx");
builder.CloseFile();
