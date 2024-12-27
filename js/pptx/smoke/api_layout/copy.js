builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(0);

var nCountBefore = oMaster.GetLayoutsCount();
var oCopyLayout = oLayout.Copy();
oMaster.AddLayout(0, oCopyLayout);
var nCountAfter = oMaster.GetLayoutsCount();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Layouts before: " + nCountBefore + ", after: " + nCountAfter);
oParagraph.SetHighlight("black");
oCopyLayout.AddObject(oShape);
builder.SaveFile("pptx", "Copy.pptx");
builder.CloseFile();
