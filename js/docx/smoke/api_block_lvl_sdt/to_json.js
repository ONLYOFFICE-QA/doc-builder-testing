builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
        CustomDefaultStyle(oDocument)
    var oBlockLvlSdt = Api.CreateBlockLvlSdt();
        oBlockLvlSdt.SetAlias("№1");
    var oBlockContent = oBlockLvlSdt.GetContent()
        oBlockContent.GetElement(0).AddText("blockLvlSdt");
    var oNumbering = oDocument.CreateNumbering("bullet");
        for (let nLvl = 0; nLvl < 8; ++nLvl) {
            var oNumLvl = oNumbering.GetLevel(nLvl);
            var oParagraph = Api.CreateParagraph();
            oParagraph.AddText("Default bullet lvl " + (nLvl + 1));
            oParagraph.SetNumbering(oNumLvl);
            oParagraph.SetContextualSpacing(true);
            oBlockContent.Push(oParagraph);
        }
    var json = oBlockLvlSdt.ToJSON(true, true);
        function CustomDefaultStyle(oDocument){
            var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
            var oTextPr = oNormalStyle.GetTextPr();
            oTextPr.SetColor(0x26, 0x26, 0x26, false);
            oTextPr.SetFontFamily("Calibri Light");
            oTextPr.SetFontSize(32);
        }
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"];
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText(json)
    var oBlockSdtFromJSON = Api.FromJSON(json);
        oDocument.AddElement(0, oBlockSdtFromJSON);
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();
