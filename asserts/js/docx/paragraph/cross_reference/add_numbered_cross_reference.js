builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oNum = oDocument.CreateNumbering();

for(let nlvl = 0; nlvl < 2; ++nlvl) {

    let oNumLvl = oNum.GetLevel(nlvl);
    console.log(oNumLvl.GetClassType())
    let sFormatString = ''

    for(let nTempLvl = 1; nTempLvl <= (nlvl + 1); ++nTempLvl) {
        sFormatString += "%" + nTempLvl + ".";
    }

    oNumLvl.SetCustomType("decimal", sFormatString, "left");
    oNumLvl.SetStart(nlvl + 1);
    oNumLvl.SetSuff("space");
    let oPar = Api.CreateParagraph();
    oPar.AddText("Numbered paragraph lvl " + (nlvl + 1));
    oPar.SetNumbering(oNumLvl);
    oPar.SetContextualSpacing(true);
    oDocument.Push(oPar);
}

let oPar1 = Api.CreateParagraph();
    oPar1.AddText('Page Number ');
let oPar2 = Api.CreateParagraph();
    oPar2.AddText('Paragraph Number ');
let oPar3 = Api.CreateParagraph();
    oPar3.AddText('No Context ');
let oPar4 = Api.CreateParagraph();
    oPar4.AddText('Full Context ');
let oPar5 = Api.CreateParagraph();
    oPar5.AddText('');
let oPar6 = Api.CreateParagraph();
    oPar6.AddText('');

let arrNumParagraphs = oDocument.GetAllNumberedParagraphs()
let oNumParLvl1 = arrNumParagraphs[0];
let oNumParLvl2 = arrNumParagraphs[1];

let arrPar = [oPar1, oPar2, oPar3, oPar4, oPar5, oPar6];
    arrPar.forEach(element => oDocument.Push(element));

oPar1.AddNumberedCrossRef('pageNum', oNumParLvl1, true, false);
oPar2.AddNumberedCrossRef('paraNum', oNumParLvl1, true, false);
oPar3.AddNumberedCrossRef('noCtxParaNum', oNumParLvl2, true, false);
oPar4.AddNumberedCrossRef('fullCtxParaNum', oNumParLvl2, true, false, '*');
oPar5.AddNumberedCrossRef('text', oNumParLvl1, true);
oPar6.AddNumberedCrossRef('aboveBelow', oNumParLvl1, true);
builder.SaveFile("docx", "add_numbered_cross_reference.docx");
builder.CloseFile();
