builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(0);

var oImage = Api.CreateImage("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oLayout.AddObject(oImage);
var aShapes = oLayout.GetAllShapes();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Shapes count: ' + aShapes.length);
oParagraph.AddLineBreak();
var aShapesTypes = []
for (var i=0; i<aShapes.length; i++){
    aShapesTypes.push(aShapes[i].GetClassType());
}
oParagraph.AddText("Types: " + aShapesTypes.join(", "));
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllShapes.pptx");
builder.CloseFile();
