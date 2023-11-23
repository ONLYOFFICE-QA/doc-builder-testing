builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
var oRGBColor = Api.CreateRGBColor(255, 0, 0);
var json = oRGBColor.ToJSON();
oParagraph.AddText("JSON representation of RGB color: " + json);
oDocument.Push(oParagraph);
GlobalVariable["RGBColorJSON"] = json;
builder.CloseFile()
/////////////////////////

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var json = GlobalVariable["RGBColorJSON"];
var oRGBColorFromJSON = Api.FromJSON(json);
oRGBColorFromJSON.SetDefaultStyle();
oParagraph.AddElement(oRGBColorFromJSON);
var oParagraph1 = Api.CreateParagraph();
oDocument.Push(oParagraph1);
oParagraph1.AddText(json);
builder.SaveFile("docx", "RGBColorDocument.docx");
builder.CloseFile();





