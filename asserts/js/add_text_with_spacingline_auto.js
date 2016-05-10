builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(3 * 240, "auto");
oParagraph.AddText("Auto:3");
oDocument.Push(oParagraph);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_spacingline_auto_in_paragraph.docx");
builder.CloseFile();