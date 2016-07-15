builder.CreateFile("docx");

//Проверям вставку таблицы в footer

var Api = editor;

var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;


var oParagraph = Api.CreateParagraph();
var oFinalSection   = oDocument.GetFinalSection();
var oDocContent = oFinalSection.GetFooter("default", true);
oTable = Api.CreateTable(3, 3);
oDocContent.Push(oTable);


builder.SaveFile("docx", "add_table_in_footer.docx");
builder.CloseFile();