builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText("ONLYOFFICE Document Builder");
    var oRange = Api.CreateRange(oParagraph, 0, 11);
    var json = oRange.ToJSON(true, true);
GlobalVariable["JSON"] = json;
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var json = GlobalVariable["JSON"]
    var oRangeFromJSON = Api.FromJSON(json);
        oDocument.Push(oRangeFromJSON[0]);
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText(json);
builder.SaveFile("docx", "ParagraphToJSON.docx");
builder.CloseFile();
