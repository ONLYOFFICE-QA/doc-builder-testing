builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    let oParagraph = oDocument.GetElement(0);
    var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
        oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
    var oTableStylePr = oTableStyle.GetConditionalTableStyle();
    var json = oTableStylePr.ToJSON();
        GlobalVariable["tableStylePrJSON"] = json;
    var oTableStylePrFromJSON = Api.FromJSON(json);
    var sType = oTableStylePrFromJSON.GetClassType();
        oParagraph.AddText("Class type = " + sType);
        oParagraph.AddText(json);
        oDocument.Push(oParagraph);
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var oNewDocument = Api.GetDocument();
    let oParagraph = oNewDocument.GetElement(0);
    var jsonFromGlobalVar = GlobalVariable["tableStylePrJSON"];
    var oTableStylePrFromJSON = Api.FromJSON(jsonFromGlobalVar);
        oNewDocument.Push(oTableStylePrFromJSON);
        oParagraph.AddText(jsonFromGlobalVar);
        oNewDocument.Push(oParagraph);
builder.SaveFile("docx", "api_table_styleToJSON.docx");
builder.CloseFile();