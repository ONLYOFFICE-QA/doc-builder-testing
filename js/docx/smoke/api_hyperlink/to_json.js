builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var oHyperlink = Api.CreateHyperlink("https://api.onlyoffice.com/", "ONLYOFFICE Document Builder", "ONLYOFFICE for developers");
        oParagraph.Push(oHyperlink)
    let json = oHyperlink.ToJSON(true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    var json = GlobalVariable["JSON"]
    var oHyperlinkFromJSON = Api.FromJSON(json);
        oHyperlinkFromJSON.SetDefaultStyle();
        oParagraph.AddElement(oHyperlinkFromJSON);

    var oParagraph1 = Api.CreateParagraph();
        oDocument.Push(oParagraph1);
        oParagraph1.AddText(json);
builder.SaveFile("docx", "RunToJSON.docx");
builder.CloseFile();
