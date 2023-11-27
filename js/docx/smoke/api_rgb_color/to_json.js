builder.CreateFile("docx");
let oDocument = Api.GetDocument();
let oParagraph = oDocument.GetElement(0);
let oRGBColor = Api.CreateRGBColor(255, 111, 61);
let jsonRGBColor = oRGBColor.ToJSON();
oParagraph.AddText(jsonRGBColor);
let oGs1 = Api.CreateGradientStop(oRGBColor, 0);
let oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
let oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
let oStroke = Api.CreateStroke(0, Api.CreateNoFill());
let oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
let bWriteNumberings = false;
let bWriteStyles = true;
let jsonDrawing = oDrawing.ToJSON(bWriteNumberings, bWriteStyles);
GlobalVariable["JSON_RGBColor"] = jsonRGBColor;
GlobalVariable["JSON_Drawing"] = jsonDrawing;
builder.CloseFile();


/////////////////////


builder.CreateFile("docx");
let oNewDocument = Api.GetDocument();
let jsonRGBColor = GlobalVariable["JSON_RGBColor"];
let jsonDrawing = GlobalVariable["JSON_Drawing"];
let oParagraphDrawing = Api.CreateParagraph();
oParagraphDrawing.AddText(jsonDrawing);
oNewDocument.Push(oParagraphDrawing);
let oRGBColorFromJSON = Api.FromJSON(jsonRGBColor);
let oParagraphRGBColorObject = Api.CreateParagraph();
oParagraphRGBColorObject.AddDrawing(oRGBColorFromJSON);
oNewDocument.Push(oParagraphRGBColorObject);
let oParagraphRGBColor = Api.CreateParagraph();
oParagraphRGBColor.AddText(jsonRGBColor);
oNewDocument.Push(oParagraphRGBColor);
let oDrawingFromJSON = Api.FromJSON(jsonDrawing);
let oParagraphDrawingObject = Api.CreateParagraph();
oParagraphDrawingObject.AddDrawing(oDrawingFromJSON);
oNewDocument.Push(oParagraphDrawingObject);
builder.SaveFile("docx", "RGBColorToJSON.docx");
builder.CloseFile();
