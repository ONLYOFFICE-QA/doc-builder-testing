builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
oDocument.GetRange(21, 28).AddBookmark("BookmarkName");

let oBookmark = oDocument.GetBookmark("BookmarkName");
oBookmark.Select();
let oRange = oDocument.GetRangeBySelect();
oRange.SetBold(true);
builder.SaveFile("docx", "Select.docx");
builder.CloseFile();
