builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster0 = oPresentation.GetMaster(0);
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);
oMaster0.Delete();

var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oDrawing = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oDrawing.SetPosition(608400, 1267200);
oDrawing.SetSize(300 * 36000, 130 * 36000);
oMaster.AddObject(oDrawing);
var aDrawings = oMaster.GetAllDrawings();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Drawings count: ' + aDrawings.length + ', type: ' + aDrawings[0].GetClassType());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllDrawings.pptx");
builder.CloseFile();
