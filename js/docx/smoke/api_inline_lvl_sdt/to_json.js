builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oInlineLvlSdt = Api.CreateInlineLvlSdt();
        oInlineLvlSdt.SetAlias("№1");
        oInlineLvlSdt.AddText(oInlineLvlSdt.GetClassType());
        oParagraph.AddInlineLvlSdt(oInlineLvlSdt);
    var json = oInlineLvlSdt.ToJSON(true);

GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"];
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oInlineLvlSdtFromJSON = Api.FromJSON(json);
        oParagraph.AddInlineLvlSdt(oInlineLvlSdtFromJSON);
        oParagraph = Api.CreateParagraph();
        oParagraph.AddText(json)
        oDocument.Push(oParagraph)
builder.SaveFile("docx", "ToJSON.docx");
builder.CloseFile();
