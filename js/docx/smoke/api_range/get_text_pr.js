builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText("Check GetRange method");
        oDocument.Push(oParagraph);
    var oRange2 = oParagraph.GetRange(0, 3);
        oRange2.SetItalic(true);
    var oRange3 = oRange2.GetRange(6, 11);
        oRange3.SetColor(255, 0, 0);
    var oRange1 = oDocument.GetRange();
        oRange1.SetBold(true);
    var oTextPr = oRange1.GetTextPr()
    const object1 = {
        GetBold: String(oTextPr.GetBold()),
        GetCaps: String(oTextPr.GetCaps()),
        GetClassType: String(oTextPr.GetClassType()),
        GetColor: String(oTextPr.GetColor()),
        GetDoubleStrikeout: String(oTextPr.GetDoubleStrikeout()),
        GetFontFamily: String(oTextPr.GetFontFamily()),
        GetFontSize: String(oTextPr.GetFontSize()),
        GetHighlight: String(oTextPr.GetHighlight()),
        GetItalic: String(oTextPr.GetItalic()),
        GetLanguage: String(oTextPr.GetLanguage()),
        GetPosition: String(oTextPr.GetPosition()),
        GetShd: String(oTextPr.GetShd()),
        GetSmallCaps: String(oTextPr.GetSmallCaps()),
        GetSpacing: String(oTextPr.GetSpacing()),
        GetStrikeout: String(oTextPr.GetStrikeout()),
        GetStyle: String(oTextPr.GetStyle()),
        GetUnderline: String(oTextPr.GetUnderline()),
        GetVertAlign: String(oTextPr.GetVertAlign())
    };
    oParagraph = Api.CreateParagraph()
    oParagraph.AddText(JSON.stringify(object1))
    oDocument.Push(oParagraph)
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();
