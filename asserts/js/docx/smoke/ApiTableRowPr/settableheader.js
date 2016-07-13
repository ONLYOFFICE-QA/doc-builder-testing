builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oCell, oTableRowPr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("We create a 3x3 table and set all table rows as the table headers:");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetTableLook(true, true, true, true, false, false);
oTableRowPr = oTableStyle.GetTableRowPr();
oTableRowPr.SetTableHeader(true);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetTableHeader.docx");
builder.CloseFile();
            