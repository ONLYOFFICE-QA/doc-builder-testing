builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oTheme = oMaster.GetTheme();
var oFonts = oTheme.GetFontScheme();
oFonts.SetFonts("Times New Roman");
oTheme.SetFontScheme(oFonts);
var result = oMaster.SetTheme(oTheme)

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('SetTheme result: ' + result);
oParagraph.AddLineBreak();
oParagraph.AddText('Fonts: ' + oTheme.GetFontScheme().ToJSON());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "SetTheme.pptx");
builder.CloseFile();