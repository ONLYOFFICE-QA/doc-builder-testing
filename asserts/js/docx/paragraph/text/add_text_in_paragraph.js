builder.CreateFile("docx");
var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("test");

builder.SaveFile("docx", "add_text_in_paragraph.docx");
builder.CloseFile();