builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(0, 11).AddBookmark("Bookmark 1");
oDocument.GetRange(23, 28).AddBookmark("Bookmark 2");
builder.SaveFile("docx", "GetBookmark.docx");
builder.CloseFile();
