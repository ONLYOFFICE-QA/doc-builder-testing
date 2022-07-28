builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oHeading = oDocument.GetStyle("Heading 1");
let oParagraph = oDocument.GetElement(0);
    oParagraph.AddText("Heading 1");
    oParagraph.SetStyle(oHeading);

let oParagraph1 = Api.CreateParagraph();
    oParagraph1.AddText('');
let oParagraph2 = Api.CreateParagraph();
    oParagraph2.AddText('Page Number ');
let oParagraph3 = Api.CreateParagraph();
    oParagraph3.AddText('Heading number ');
let oParagraph4 = Api.CreateParagraph();
    oParagraph4.AddText('');

let arrPar = [oParagraph1, oParagraph2, oParagraph3, oParagraph4];
    arrPar.forEach(element => oDocument.Push(element));

let aHeadingParagraphs = oDocument.GetAllHeadingParagraphs();

oParagraph1.AddHeadingCrossRef("text", aHeadingParagraphs[0], true);
oParagraph2.AddHeadingCrossRef("pageNum", aHeadingParagraphs[0], true, false);
oParagraph3.AddHeadingCrossRef("headingNum", aHeadingParagraphs[0], true, true);
oParagraph4.AddHeadingCrossRef("aboveBelow", aHeadingParagraphs[0], true);
builder.SaveFile("docx", "add_heading_cross_reference.docx");
builder.CloseFile();
