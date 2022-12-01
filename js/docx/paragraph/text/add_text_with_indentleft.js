builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
  var oParagraph = Api.CreateParagraph();
  oParagraph.SetIndLeft(1500);
  oParagraph.AddText("LeftIndent");
  oDocument.Push(oParagraph);
builder.SaveFile("docx", "add_text_with_indentleft.docx");
builder.CloseFile();
