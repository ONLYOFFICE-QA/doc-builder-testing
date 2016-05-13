builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection;

oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(2, 720);

builder.SaveFile("docx", "/home/pc/Documents/temp_docx/two_columns.docx");
builder.CloseFile();