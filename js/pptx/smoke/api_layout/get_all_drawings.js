builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
// oPresentation.GetMaster(0).Delete();
oSlide.RemoveAllObjects();
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);
var oLayout = Api.CreateLayout();
oMaster.AddLayout(0, oLayout);

var oImage = Api.CreateImage("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000);
oLayout.AddObject(oImage);
var oOleObject = Api.CreateOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}");
oOleObject.SetSize(200 * 36000, 130 * 36000);
oOleObject.SetPosition(70 * 36000, 30 * 36000);
oLayout.AddObject(oOleObject);
var aDrawings = oLayout.GetAllDrawings();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('Drawings count: ' + aDrawings.length);
oParagraph.AddLineBreak();
var aDrawingsTypes = []
for (var i=0; i<aDrawings.length; i++){
    aDrawingsTypes.push(aDrawings[i].GetClassType());
}
oParagraph.AddText('Types: ' + aDrawingsTypes.join(', '));
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllDrawings.pptx");
builder.CloseFile();
