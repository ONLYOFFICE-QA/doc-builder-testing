builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(3);

var oImage = Api.CreateImage("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oLayout.AddObject(oImage);
oLayout.MoveTo(0);
var oLayout1 = oMaster.GetLayout(0);
var oLayout2 = oMaster.GetLayout(3);

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Layout(0) images: " + oLayout1.GetAllImages().length + ", Layout(3) images: " + oLayout2.GetAllImages().length);
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "RemoveObject.pptx");
builder.CloseFile();
