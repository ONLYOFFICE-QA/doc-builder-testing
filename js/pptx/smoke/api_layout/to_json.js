builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(0);
var json = oLayout.ToJSON(true, false);

var oLayoutFromJSON = Api.FromJSON(json);
oMaster.AddLayout(0, oLayoutFromJSON);
var sType = oLayoutFromJSON.GetClassType();
var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('sType: ' + sType);
oParagraph.SetHighlight("black");
oLayoutFromJSON.AddObject(oShape);
builder.SaveFile("pptx", "ToJSON.pptx");
builder.CloseFile();
