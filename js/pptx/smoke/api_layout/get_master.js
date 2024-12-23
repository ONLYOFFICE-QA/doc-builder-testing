builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
var oLayout = oSlide.GetLayout();
var oMaster = oLayout.GetMaster();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("GetMaster type: " + oMaster.GetClassType());
oParagraph.SetHighlight("black");
oLayout.AddObject(oShape);
builder.SaveFile("pptx", "GetMaster.pptx");
builder.CloseFile();
