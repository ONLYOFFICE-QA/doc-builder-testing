
            builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTable, oTableStyle, oTablePr;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("");
oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered - Accent 5"));
oTablePr = oTableStyle.GetTablePr();
oTable = Api.CreateTable(10, 10);
oTable.SetTableLook(true, true, true, true, true, true);
oTablePr.SetStyleRowBandSize(2);
oTableStyle.GetConditionalTableStyle("bandedRow").GetTableRowPr().SetHeight("atLeast", 720);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
builder.SaveFile("docx", "SetStyleRowBandSize.docx");
builder.CloseFile();
            