builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);

var nCountBefore = oPresentation.GetMastersCount();
var oCopyMaster = oMaster.Copy();
oPresentation.AddMaster(nCountBefore + 1, oCopyMaster);
var nCountAfter = oPresentation.GetMastersCount();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Masters before: " + nCountBefore + ", after: " + nCountAfter);
oParagraph.SetHighlight("black");
oCopyMaster.AddObject(oShape);
builder.SaveFile("pptx", "Copy.pptx");
builder.CloseFile();
