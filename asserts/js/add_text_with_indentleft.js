builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

  oParagraph = Api.CreateParagraph();
  oParagraph.SetIndLeft(1500);
  oParagraph.AddText("LeftIndent");
  oDocument.Push(oParagraph);


builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_with_indentleft.docx");
builder.CloseFile();