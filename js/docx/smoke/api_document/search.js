builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is text for document Search method");

oParagraph = Api.CreateParagraph();
var oRun1 = Api.CreateRun();
oRun1.AddText("This is");
oParagraph.Push(oRun1);
oRun1.AddHyperlink("https://api.onlyoffice.com/", "first link");
oParagraph.AddText(" ");
var oRun2 = Api.CreateRun();
oRun2.AddText("text for document");
oParagraph.Push(oRun2);
oRun2.AddHyperlink("https://api.onlyoffice.com/", "second link");
oParagraph.AddText(" Search method");
oDocument.Push(oParagraph);

var oSearch = oDocument.Search("search");
var aSearchResult = [];
for (var i = 0; i < oSearch.length; i++) {
    aSearchResult.push(oSearch[i].GetText());
    oSearch[i].SetHighlight("green");
}
oParagraph = Api.CreateParagraph();
oParagraph.AddText(aSearchResult.join(", "));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "Search.docx");
builder.CloseFile();
