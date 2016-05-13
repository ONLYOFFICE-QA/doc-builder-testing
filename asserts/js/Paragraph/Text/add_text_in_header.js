builder.CreateFile("docx");

//Проверям ввод текста в хедер

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

var oParagraph = Api.CreateParagraph();
var oFinalSection   = oDocument.GetFinalSection();
var oDocContent = oFinalSection.GetHeader("default", true);
oDocContent.Push(oParagraph);
oParagraph.AddText("header");

builder.SaveFile("docx", "/home/ilya/Documents/temp_docx/add_text_in_header.docx");
builder.CloseFile();