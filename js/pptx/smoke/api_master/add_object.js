builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
// oPresentation.GetMaster(0).Delete();
oSlide.RemoveAllObjects();
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);

var nCountBefore = oMaster.GetAllShapes().length;
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oShape.SetSize(300 * 36000, 130 * 36000);
oMaster.AddObject(oShape);
var nCountAfter = oMaster.GetAllShapes().length;

var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
oRun.AddText('before: ' + nCountBefore + ', after: ' + nCountAfter);
oParagraph.AddElement(oRun);
builder.SaveFile("pptx", "AddObject.pptx");
builder.CloseFile();
