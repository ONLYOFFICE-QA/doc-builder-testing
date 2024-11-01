builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oHeadingStyle = oDocument.GetStyle("Heading 3");
oParagraph.AddText("Employee pass card");
oParagraph.SetStyle(oHeadingStyle);

var oPictureForm = Api.CreatePictureForm({"key": "Photo", "tip": "Upload your photo", "required": false, "placeholder": "Photo", "scaleFlag": "tooBig", "lockAspectRatio": true, "respectBorders": false, "shiftX": 50, "shiftY": 50});
oParagraph = Api.CreateParagraph();
oParagraph.AddElement(oPictureForm);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
var oTextForm = Api.CreateTextForm({"key": "First name", "tip": "Enter your first name", "required": false, "placeholder": "First name", "comb": true, "maxCharacters": 13, "cellWidth": 3, "multiLine": false, "autoFit": false});
oParagraph.AddElement(oTextForm);
oPictureForm.SetImage("https://legacy-api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png");
oDocument.Push(oParagraph);

Api.Save();
builder.SaveFile("docxf", "PassCard.docxf");
builder.CloseFile();
