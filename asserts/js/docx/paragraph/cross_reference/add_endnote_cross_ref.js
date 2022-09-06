builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
oParagraph.AddText('Endnote Reference');
let oRange = oParagraph.GetRange(7, 16);
oRange.Select();
oDocument.AddEndnote();
let aEnd = oDocument.GetEndNotesFirstParagraphs();
aEnd[0].AddText('This is a creating footnote');

let oParagraph1 = Api.CreateParagraph();
oParagraph1.AddText('Endnote number ');
let oParagraph2 = Api.CreateParagraph();
oParagraph2.AddText('Page Number ');
let oParagraph3 = Api.CreateParagraph();
oParagraph3.AddText('Above/Below ');
let oParagraph4 = Api.CreateParagraph();
oParagraph4.AddText('Form Endnote number');

let arrPar = [oParagraph1, oParagraph2, oParagraph3, oParagraph4];
arrPar.forEach(element => oDocument.Push(element));

oParagraph1.AddEndnoteCrossRef("endnoteNum",aEnd[0], true, false);
oParagraph2.AddEndnoteCrossRef("pageNum", aEnd[0], true, false);
oParagraph3.AddEndnoteCrossRef("aboveBelow", aEnd[0], true);
oParagraph4.AddEndnoteCrossRef("formEndnoteNum", aEnd[0], true, false);
builder.SaveFile("docx", "add_endnote_cross_reference.docx");
builder.CloseFile();
