builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
    oSlide.RemoveAllObjects();
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
    oShape.SetPosition(608400, 1267200);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
    oRun.AddText("This is just a sample text. ");
    oRun.AddText("The text properties are changed and the style is added to the paragraph. ");
    oRun.AddLineBreak();
    oParagraph.AddElement(oRun);
var oRunTextPr = oRun.GetTextPr();
    oRunTextPr.SetHighlight("lightGray");
    oSlide.AddObject(oShape);
    oParagraph = Api.CreateParagraph();

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
var oSlide = Api.CreateSlide()
var oShape = Api.CreateShape("accentBorderCallout1",
    200 * 36000, 130 * 36000);
    oShape.SetPosition(608400, 1267200);
    oSlide.AddObject(oShape);
    oPresentation.AddSlide(oSlide)
    oPresentation.GetSlideByIndex(1)
                .GetAllShapes()[0]
                .GetDocContent()
                .GetElement(0)
                .AddText(JSON.stringify(object1))
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetTextPr.pptx");
builder.CloseFile();
