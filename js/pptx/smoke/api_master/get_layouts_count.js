builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster0 = oPresentation.GetMaster(0);
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);
oMaster0.Delete();

var oLayout = Api.CreateLayout();
oMaster.AddLayout(0, oLayout);
oMaster.AddLayout(1, oLayout);

oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Layouts count: ' + oMaster.GetLayoutsCount());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetLayoutsCount.pptx");
builder.CloseFile();
