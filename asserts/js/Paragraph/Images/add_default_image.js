builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

 oParagraph = Api.CreateParagraph();
 oDocument.Push(oParagraph);
 oDrawing = Api.CreateDrawing(1000 * 635, 2000 * 635);
 oParagraph.AddDrawing(oDrawing);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_default_image.docx");
builder.CloseFile();