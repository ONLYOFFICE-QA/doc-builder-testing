builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
    oParagraph.AddText("Paragraph with bookmark");
let oRange = oDocument.GetRange(0, 9);
    oRange.AddBookmark("Bookmark");

let oParagraph1 = Api.CreateParagraph();
    oParagraph1.AddText('Paragraph text ');
let oParagraph2 = Api.CreateParagraph();
    oParagraph2.AddText('Page Number ');
let oParagraph3 = Api.CreateParagraph();
    oParagraph3.AddText('Heading number ');
let oParagraph4 = Api.CreateParagraph();
    oParagraph4.AddText('');

let arrPar = [oParagraph1, oParagraph2, oParagraph3, oParagraph4];
    arrPar.forEach(element => oDocument.Push(element));

oParagraph1.AddBookmarkCrossRef("text","Bookmark", true);
oParagraph2.AddBookmarkCrossRef("pageNum", "Bookmark", true, false);
oParagraph3.AddBookmarkCrossRef("paraNum", "Bookmark", true, false);
oParagraph4.AddBookmarkCrossRef("aboveBelow", "Bookmark", true);
builder.SaveFile("docx", "add_bookmark_cross_reference.docx");
builder.CloseFile();
