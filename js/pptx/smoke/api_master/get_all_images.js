builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster0 = oPresentation.GetMaster(0);
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);
oMaster0.Delete();

var oImage = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oMaster.AddObject(oImage);
var aImages = oMaster.GetAllImages();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Images count: ' + aImages.length + ', type: ' + aImages[0].GetClassType());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllImages.pptx");
builder.CloseFile();