builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
let oRGBColor = Api.CreateRGBColor(255, 111, 61);
let jsonRGBColor = oRGBColor.ToJSON();
oParagraph.AddText(jsonRGBColor);
GlobalVariable["JSON_RGBColor"] = jsonRGBColor;
builder.CloseFile();


/////////////////////


builder.CreateFile("docx");
let oNewDocument = Api.GetDocument();
let jsonRGBColor = GlobalVariable["JSON_RGBColor"];
let oParagraphRGBColor = oNewDocument.GetElement(0);
oParagraphRGBColor.AddText(jsonRGBColor);

let oRGBColorFromJSON = Api.FromJSON(jsonRGBColor);
let oParagraphRGBColorObject = Api.CreateParagraph();
oParagraphRGBColorObject.AddDrawing(oRGBColorFromJSON);
oNewDocument.Push(oParagraphRGBColorObject);

let oGs1 = Api.CreateGradientStop(oRGBColorFromJSON, 0);
let oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
let oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
let oStroke = Api.CreateStroke(0, Api.CreateNoFill());
let oDrawingFromJSON = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
let bWriteNumberings = false;
let bWriteStyles = true;
let jsonDrawingFromJSON = oDrawingFromJSON.ToJSON(bWriteNumberings, bWriteStyles);

let oParagraphDrawing = Api.CreateParagraph();
oParagraphDrawing.AddText(jsonDrawingFromJSON);
oNewDocument.Push(oParagraphDrawing);

let oDrawingFromJSONObj = Api.FromJSON(jsonDrawingFromJSON);
let oParagraphDrawingObject = Api.CreateParagraph();
oParagraphDrawingObject.AddDrawing(oDrawingFromJSONObj);
oNewDocument.Push(oParagraphDrawingObject);

builder.SaveFile("docx", "RGBColorToJSON.docx");
builder.CloseFile();
