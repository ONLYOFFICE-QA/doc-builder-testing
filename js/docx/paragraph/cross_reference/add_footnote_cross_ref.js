builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
    oParagraph.AddText('Footnote Reference');
let oRange = oParagraph.GetRange(8, 17);
    oRange.Select();
    oDocument.AddFootnote();
let aFoo = oDocument.GetFootnotesFirstParagraphs();
    aFoo[0].AddText('This is a creating footnote');

let oParagraph1 = Api.CreateParagraph();
    oParagraph1.AddText('Footnote number ');
let oParagraph2 = Api.CreateParagraph();
    oParagraph2.AddText('Page Number ');
let oParagraph3 = Api.CreateParagraph();
    oParagraph3.AddText('Paragraph text ');
let oParagraph4 = Api.CreateParagraph();
    oParagraph4.AddText('Form Footnote number');

let arrPar = [oParagraph1, oParagraph2, oParagraph3, oParagraph4];
    arrPar.forEach(element => oDocument.Push(element));

oParagraph1.AddFootnoteCrossRef("footnoteNum",aFoo[0], true, false);
oParagraph2.AddFootnoteCrossRef("pageNum", aFoo[0], true, false);
oParagraph3.AddFootnoteCrossRef("aboveBelow", aFoo[0], true);
oParagraph4.AddFootnoteCrossRef("formFootnoteNum", aFoo[0], true, false);
builder.SaveFile("docx", "add_footnote_cross_reference.docx");
builder.CloseFile();
