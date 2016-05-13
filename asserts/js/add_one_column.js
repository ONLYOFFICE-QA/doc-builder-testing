builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oFinalSection;

oFinalSection   = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(1, 720);

builder.SaveFile("docx", "/home/pc/Documents/temp_docx/one_column.docx");
builder.CloseFile();