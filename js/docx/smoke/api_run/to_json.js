builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = Api.CreateRun();
oRun.AddText("This is a text run");
var json = oRun.ToJSON(true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var json = GlobalVariable["JSON"]
var oRunFromJSON = Api.FromJSON(json);
oParagraph.AddElement(oRunFromJSON);
var oParagraph1 = Api.CreateParagraph();
oDocument.Push(oParagraph1)
oParagraph1.AddText(json);
builder.SaveFile("docx", "RunToJSON.docx");
builder.CloseFile();