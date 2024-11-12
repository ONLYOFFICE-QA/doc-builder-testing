builder.CreateFile("docx");
var oDocument = Api.GetDocument()
var oParagraph = oDocument.GetElement(0)
var oRun = Api.CreateRun()
var oRunTextPr = oRun.GetTextPr()

const object1 = {
    GetBold: String(oRunTextPr.GetBold()),
    GetCaps: String(oRunTextPr.GetCaps()),
    GetClassType: String(oRunTextPr.GetClassType()),
    GetColor: String(oRunTextPr.GetColor()),
    GetDoubleStrikeout: String(oRunTextPr.GetDoubleStrikeout()),
    GetFontFamily: String(oRunTextPr.GetFontFamily()),
    GetFontSize: String(oRunTextPr.GetFontSize()),
    GetHighlight: String(oRunTextPr.GetHighlight()),
    GetItalic: String(oRunTextPr.GetItalic()),
    GetLanguage: String(oRunTextPr.GetLanguage()),
    GetPosition: String(oRunTextPr.GetPosition()),
    GetShd: String(oRunTextPr.GetShd()),
    GetSmallCaps: String(oRunTextPr.GetSmallCaps()),
    GetSpacing: String(oRunTextPr.GetSpacing()),
    GetStrikeout: String(oRunTextPr.GetStrikeout()),
    GetStyle: String(oRunTextPr.GetStyle()),
    GetUnderline: String(oRunTextPr.GetUnderline()),
    GetVertAlign: String(oRunTextPr.GetVertAlign())
};
oParagraph.AddText(JSON.stringify(object1))
builder.SaveFile("docx", "GetTextPr.docx");
builder.CloseFile();
