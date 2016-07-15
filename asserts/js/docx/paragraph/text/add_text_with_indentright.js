builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

 oParagraph = Api.CreateParagraph();
 oParagraph.SetIndRight(1000);
 oParagraph.AddText("RightIndent");
 oDocument.Push(oParagraph);


builder.SaveFile("docx", "add_text_with_indentright.docx");
builder.CloseFile();