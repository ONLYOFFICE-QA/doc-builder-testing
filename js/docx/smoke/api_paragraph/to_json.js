builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph");
var json = oParagraph.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var json = GlobalVariable["JSON"]
oParagraph.AddText(json);
var oParagraphFromJSON = Api.FromJSON(json);
oDocument.Push(oParagraphFromJSON);
builder.SaveFile("docx", "ParagraphToJSON.docx");
builder.CloseFile();
