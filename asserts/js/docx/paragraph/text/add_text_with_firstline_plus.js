builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

  oParagraph = Api.CreateParagraph();
  oParagraph.SetIndFirstLine(100);
  oParagraph.AddText("First line indent is 5pt");
  oDocument.Push(oParagraph);


builder.SaveFile("docx", "add_text_with_firstline_plus.docx");
builder.CloseFile();