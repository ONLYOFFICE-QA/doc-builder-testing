builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The table is aligned at the center of the page horizontally.");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(2, 2);
oTable.SetWidth("percent", 50);
oTable.SetStyle(oTableStyle);
oTable.SetJc("center");
oDocument.Push(oTable);
builder.SaveFile("docx", "SetJc.docx");
builder.CloseFile();
            