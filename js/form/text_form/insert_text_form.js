builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    const config = {
        key: "key",
        placeholder: "placeholder",
        tip: "tip",
        tag: "tag",
    }
    var oTextForm = Api.CreateTextForm(config);
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddElement(oTextForm);
        oDocument.InsertContent([oParagraph], false);
builder.SaveFile("docx", "insert_text_form.docx");
builder.CloseFile();
