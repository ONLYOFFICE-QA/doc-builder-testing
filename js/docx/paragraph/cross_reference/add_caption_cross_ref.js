builder.CreateFile("docx");
// Api.GetDocument().RemoveAllElements();
// let p = (x,y) => { console.log(x,y) }

let oDoc = Api.GetDocument();
let oPar = Api.CreateParagraph();
    oPar.AddText('Reference table');
    oDoc.Push(oPar);

let sAdditional = ' caption with text' // the additional text.
let sLabel = "Table" // caption label.
let bExludeLabel = false // wheter exclude label from caption.
let sNumberingFormat = "Arabic" // the possible caption numbering format.
let bBefore = false // whether insert caption before current paragraph (after/before shape, if placed in shape).
let nHeadingLvl = undefined // heading level (use if need to include chapter number).
// * Note: if need "Heading 1" then nHeadingLvl === 0 and etc.
let sCaptionSep = "hyphen" // separator (use if need to include chapter number).

    oPar.AddCaption(sAdditional, sLabel, bExludeLabel, sNumberingFormat, bBefore, nHeadingLvl, sCaptionSep)

// p('Insert caption: ', result1);

    oPar = Api.CreateParagraph();
    oPar.AddText('sRefType: entireCaption ');
let oPar1 = Api.CreateParagraph();
    oPar1.AddText('sRefType: captionText ');
let oPar2 = Api.CreateParagraph();
    oPar2.AddText('sRefType: pageNum ');
let oPar3 = Api.CreateParagraph();
    oPar3.AddText('sRefType: aboveBelow ');
let oPar4 = Api.CreateParagraph();
    oPar4.AddText('sRefType: labelNumber ');
let oPar5 = Api.CreateParagraph();
    oPar5.AddText('Result method: ');
let arrPar = [oPar, oPar1, oPar2, oPar3, oPar4, oPar5];
    arrPar.forEach(element => oDoc.Push(element));

// p(oPar.GetText())

var aCaptionParagraphs = oDoc.GetAllCaptionParagraphs("Table");

let sCaption = 'Table' // The caption label ("Equation", "Figure", "Table", or another caption label).
let sRefType = 'entireCaption' // The text or numeric value of a caption reference you want to insert.
let oParaTo = aCaptionParagraphs[0] // The caption paragraph to be referred to (must be in the document).
let bLink = true // Specifies if the reference will be inserted as a hyperlink
let bAboveBelow = false // Specifies if the above/below words indicating the position of the reference should be included (used only with the "pageNum" sRefType).

let result = oPar.AddCaptionCrossRef(sCaption, sRefType, oParaTo, bLink, bAboveBelow);
    oPar1.AddCaptionCrossRef(sCaption, 'captionText', oParaTo, bLink, bAboveBelow);
    oPar2.AddCaptionCrossRef(sCaption, 'pageNum', oParaTo, bLink, bAboveBelow);
    oPar3.AddCaptionCrossRef(sCaption, 'aboveBelow', oParaTo, bLink, bAboveBelow);
    oPar4.AddCaptionCrossRef(sCaption, 'labelNumber', oParaTo, bLink, bAboveBelow);
    oPar5.AddText(result.toString());
builder.SaveFile("docx", "add_caption_cross_ref.docx");
builder.CloseFile();
