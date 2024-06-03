builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
        oParagraph.AddText("This is a paragraph with the font family set to ");
        oParagraph.AddText('Consolas')
        oParagraph.SetFontFamily("Consolas");
builder.SaveFile("docx", "SetFontFamily.docx");
builder.CloseFile();
