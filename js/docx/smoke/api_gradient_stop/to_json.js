builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 111, 61), 0);
var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 213, 191), 100000);
var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
var jsonFill = oFill.ToJSON();
oParagraph.AddText(jsonFill);
GlobalVariable["JSON_GradientStop"] = jsonFill;
builder.CloseFile();

//////////////////////

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph1 = oDocument.GetElement(0);
var jsonGradientStop = GlobalVariable["JSON_GradientStop"];
var oGradientStopFromJSON = Api.FromJSON(jsonGradientStop);
oParagraph1.AddText(jsonGradientStop);
oDocument.Push(oParagraph1);
var oParagraph2 = Api.CreateParagraph();
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oDrawing = Api.CreateShape("rect", 1908000, 1404000, oGradientStopFromJSON, oStroke);
let jsonDrawing = oDrawing.ToJSON(false, true);
oParagraph2.AddText(jsonDrawing);
oDocument.Push(oParagraph2);
builder.SaveFile("docx", "GradientStopToJson.docx");
builder.CloseFile();
