builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
    var oTablePr = oTableStyle.GetTablePr();
    var json = oTablePr.ToJSON();
    var oTablePrFromJSON = Api.FromJSON(json);
    var sType = oTablePrFromJSON.GetClassType();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText(sType);
        oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json)
        oDocument.Push(oParagraph)
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();
