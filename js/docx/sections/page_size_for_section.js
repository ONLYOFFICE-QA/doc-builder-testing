builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
        oDocument.CreateNewHistoryPoint();
    var oParagraph, oFinalSection, oSection;
        oFinalSection = oDocument.GetFinalSection();
        oFinalSection.SetPageSize(11904.8, 16838); // 'A4'

        oParagraph = Api.CreateParagraph();
        oParagraph.AddText('section');
        oDocument.Push(oParagraph);
        oSection = oDocument.CreateSection(oParagraph);
        oSection.SetPageSize(12240, 15840); // 'US Letter'
builder.SaveFile("docx", "page_size_for_section.docx");
builder.CloseFile();
