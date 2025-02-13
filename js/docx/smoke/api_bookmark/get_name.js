builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark_Name");

oParagraph = Api.CreateParagraph();
oParagraph.AddText("Bookmark name: " + oDocument.GetBookmark("Bookmark_Name").GetName());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetName.docx");
builder.CloseFile();
