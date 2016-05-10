builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(200, "exact");
oParagraph.AddText("Exact:10pt");
oDocument.Push(oParagraph);

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_spacingline_exact_in_paragraph.docx");
builder.CloseFile();