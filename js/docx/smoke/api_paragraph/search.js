builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is text for paragraph Search method");
oParagraph.AddLineBreak();
var oRun1 = Api.CreateRun();
oRun1.AddText("This is text");
oParagraph.Push(oRun1);
oRun1.AddHyperlink("https://api.onlyoffice.com/", "link");
oParagraph.AddText(" for paragraph Search method");

var oSearch = oParagraph.Search("search");
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
