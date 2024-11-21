builder.OpenFile("assets/api_document_files/71120_DocWithBookmark.docx");
var oDocument = Api.GetDocument();
var oTable = oDocument.GetAllTables()[0];
oTable.GetCell(1, 0).GetContent().GetRange().Select();
var oRange1 = oDocument.GetBookmarkRange("Bookmark");
var oRange2 = oDocument.GetRangeBySelect();

var oParagraph = Api.CreateParagraph();
oParagraph.AddText(oRange1.GetText());
oParagraph.AddLineBreak();
oParagraph.AddText(oRange2.GetText());
oParagraph.AddLineBreak();
oParagraph.AddText("IntersectWith result = " + oRange1.IntersectWith(oRange2));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "IntersectWith.docx");
builder.CloseFile();
