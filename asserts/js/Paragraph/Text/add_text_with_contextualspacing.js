builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

oParagraph = Api.CreateParagraph();
oParagraph.SetContextualSpacing(true);
oParagraph.AddText("True");
oDocument.Push(oParagraph);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_contextualspacing.docx");
builder.CloseFile();