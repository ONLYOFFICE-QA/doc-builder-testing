builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetJc("left");
oParagraph.AddText("Paragraph align: left");
oDocument.Push(oParagraph);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_align_left.docx");
builder.CloseFile();