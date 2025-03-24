builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();

var oSelection = Api.GetSelection();
var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("Selection is empty: " + oSelection.IsEmpty());
oParagraph.AddLineBreak();
oSlide.Select();
oParagraph.AddText("Selection is empty: " + oSelection.IsEmpty());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "IsEmpty.pptx");
builder.CloseFile();
