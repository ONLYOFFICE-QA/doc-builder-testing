builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
Api.pluginMethod_AddComment({"UserName": "John Smith", "Text": "This is a comment."});
Api.pluginMethod_AddComment({"UserName": "Mark Potato", "Text": "This is another comment."});

var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oShape = Api.CreateShape("rect", 300 * 36000, 130 * 36000);
var oDocContent = oShape.GetDocContent();
var oParagraph = oDocContent.GetElement(0);

var arrComments = oPresentation.GetAllComments();
var commentsArray = [];
for (var i=0; i<arrComments.length; i++) {
    commentsArray.push(arrComments[i].GetText());
}
oParagraph.AddText(commentsArray.join(", "));
oParagraph.SetHighlight("lightGray");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetAllComments.pptx");
builder.CloseFile();
