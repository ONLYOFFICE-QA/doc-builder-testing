builder.CreateFile("docx");
var Api = editor;

var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

var oParagraph = Api.CreateParagraph();
var oFinalSection   = oDocument.GetFinalSection();
var oDocContent = oFinalSection.GetHeader("default", true);
oDocContent.Push(oParagraph);
oParagraph.AddText("Underline").SetUnderline(true);

builder.SaveFile("docx", "text_with_underline_in_header.docx");
builder.CloseFile();