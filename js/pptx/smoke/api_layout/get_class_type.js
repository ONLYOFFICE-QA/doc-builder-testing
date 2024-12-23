builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(0);
var sType = oLayout.GetClassType();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('GetClassType type: ' + sType);
oParagraph.SetHighlight("black");
oLayout.AddObject(oShape);
builder.SaveFile("pptx", "GetClassType.pptx");
builder.CloseFile();
