builder.CreateFile("pptx");
let oPresentation = Api.GetPresentation();
let oSlide = oPresentation.GetSlideByIndex(0);
let oMaster = oPresentation.GetMaster(0);
let oLayout = oMaster.GetLayout(0);
let aDrawingsWithPh = oLayout.GetDrawingsByPlaceholderType("subTitle");

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Drawings with placeholder subTitle count: " + aDrawingsWithPh.length);
oParagraph.SetHighlight("black");
oLayout.AddObject(oShape);
builder.SaveFile("pptx", "GetDrawingsByPlaceholderType.pptx");
builder.CloseFile();
