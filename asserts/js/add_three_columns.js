builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection;

oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(3, 720);

builder.SaveFile("docx", "/home/pc/Documents/temp_docx/three_columns.docx");
builder.CloseFile();