builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

  oParagraph = Api.CreateParagraph();
  oParagraph.SetKeepLines(true);
  oParagraph.AddText("KeepLines");
  oDocument.Push(oParagraph);


builder.SaveFile("docx", "add_text_with_keeplines.docx");
builder.CloseFile();