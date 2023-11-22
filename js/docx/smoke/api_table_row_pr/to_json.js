builder.CreateFile("docx");
var oDocument = Api.CreateDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.AddText("We create a 3x3 table and set the height of half an inch to all the rows:");
oDocument.Push(oParagraph);
var oTableStyle = Api.CreateTableStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(Api.GetStyle("Bordered - Accent 5"));
var oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetTableLook(true, true, true, true, false, false);
var oTableRowPr = oTableStyle.GetTableRowPr();
oTableRowPr.SetHeight("atLeast", 720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetHeight.docx");
builder.CloseFile();



//////////////


builder.CreateFile("docx");
var newDocument = Api.CreateDocument();
var newParagraph = newDocument.GetElement(0);
var tableJSONFromGlobal = GlobalVariable["TableJSON"];
var tableFromJSON = Api.FromJSON(tableJSONFromGlobal);
newParagraph.AddElement(tableFromJSON);
newDocument.Push(newParagraph);
builder.SaveFile("docx", "TableFromJSON.docx");
builder.CloseFile();