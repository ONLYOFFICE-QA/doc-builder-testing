builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetTabs([1000, 1500, 3000], ["center", "left", "right"]);
oParagraph.AddText("Tabs");
oDocument.Push(oParagraph);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_tabs.docx");
builder.CloseFile();