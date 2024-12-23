builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);

var nCountBefore = oMaster.GetLayoutsCount();
var oLayout = oMaster.GetLayout(0);
oLayout.Delete();
var nCountAfter = oMaster.GetLayoutsCount();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Layouts before: ' + nCountBefore + ', after: ' + nCountAfter);
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "Delete.pptx");
builder.CloseFile();
