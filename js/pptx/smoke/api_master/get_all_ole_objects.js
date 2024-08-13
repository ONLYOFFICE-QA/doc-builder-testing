builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
// oPresentation.GetMaster(0).Delete();
oSlide.RemoveAllObjects();
var oMaster = Api.CreateMaster();
oPresentation.AddMaster(1, oMaster);

var oOleObject = Api.CreateOleObject("https://i.ytimg.com/vi_webp/SKGz4pmnpgY/sddefault.webp", 130 * 36000, 90 * 36000, "https://youtu.be/SKGz4pmnpgY", "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}");
oOleObject.SetSize(200 * 36000, 130 * 36000);
oOleObject.SetPosition(70 * 36000, 30 * 36000);
oMaster.AddObject(oOleObject);
var aOleObjects = oMaster.GetAllOleObjects();

var oShape = Api.CreateShape("rect", 100 * 36000, 50 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText('OleObjects count: ' + aOleObjects.length + ', type: ' + aOleObjects[0].GetClassType());
oParagraph.SetHighlight("black");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllOleObjects.pptx");
builder.CloseFile();
