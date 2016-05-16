builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetJc("right");
oParagraph.AddText("paragraph align: right");
oDocument.Push(oParagraph);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_align_right.docx");
builder.CloseFile();