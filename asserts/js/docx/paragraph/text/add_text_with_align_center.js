builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetJc("center");
oParagraph.AddText("paragraph align: center");
oDocument.Push(oParagraph);


builder.SaveFile("docx", "add_text_with_align_center.docx");
builder.CloseFile();