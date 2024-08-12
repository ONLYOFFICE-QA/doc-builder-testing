builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();

var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);
var nCountBefore = oPresentation.GetMastersCount();
oMaster.Delete();
var nCountAfter = oPresentation.GetMastersCount();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Masters before: ' + nCountBefore + ', after: ' + nCountAfter);
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "Delete.pptx");
builder.CloseFile();
