builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var json = oMaster.ToJSON(true);
var oMasterFromJSON = Api.FromJSON(json);
var sType = oMasterFromJSON.GetClassType();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('sType: ' + sType);
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ToJSON.pptx");
builder.CloseFile();
