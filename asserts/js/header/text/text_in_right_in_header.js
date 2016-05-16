builder.CreateFile("docx");
var Api = editor;

var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

var oParagraph = Api.CreateParagraph();
oParagraph.SetJc("right");
var oFinalSection   = oDocument.GetFinalSection();
var oDocContent = oFinalSection.GetHeader("default", true);
oDocContent.Push(oParagraph);
oParagraph.AddText("Right");

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/text_in_right_in_header.docx");
builder.CloseFile();