builder.CreateFile("docx");
    var oDocument = Api.GetDocument();
    var oBlockLvlSdt = Api.CreateBlockLvlSdt();
    var oParagraph = Api.CreateParagraph();
        oParagraph.AddText("This is a block text content control.");
        oBlockLvlSdt.AddElement(oParagraph, 0);
        oDocument.AddElement(0, oBlockLvlSdt);
        oBlockLvlSdt.GetContent().GetElement(1).AddText("This is a content of the container.");

   /**
     * Returns an inner text of this document content object.
     * @memberof ApiDocumentContent
     * @typeofeditors ["CDE"]
     * @param {object} oProps - The resulting string display properties.
     * @param {boolean} oProps.NewLine - Defines if the resulting string will include line boundaries or not (they will be replaced with '\r').
     * @param {boolean} oProps.NewLineParagraph - Defines if the resulting string will include paragraph line boundaries or not.
     * @param {boolean} oProps.Numbering - Defines if the resulting string will include numbering or not.
     * @param {boolean} oProps.Math - Defines if the resulting string will include mathematical expressions or not.
     * @param {string} oProps.TableCellSeparator - Defines how the table cell separator will be specified in the resulting string.
     * @param {string} oProps.TableRowSeparator - Defines how the table row separator will be specified in the resulting string.
     * @param {string} oProps.ParaSeparator - Defines how the paragraph separator will be specified in the resulting string.
     * @param {string} oProps.TabSymbol - Defines how the tab will be specified in the resulting string.
     * @param {string} oProps.NewLineSeparator - Defines how the line separator will be specified in the resulting string (this property has the priority over *NewLine*).
     * @return {string}
     * @see office-js-api/Examples/{Editor}/ApiDocumentContent/Methods/GetText.js
     */

    var oProps = {
        "NewLine": true,
        "NewLineParagraph": true,
        "Numbering": true,
        "Math": true,
        "TableCellSeparator": "%cell%",
        "TableRowSeparator": "%row%",
        "ParaSeparator": "%paragraph%",
        "TabSymbol": "%tab%",
        "NewLineSeparator": "%newl%"
    }
    var text = oBlockLvlSdt.GetContent().GetText(oProps);
        oDocument.GetElement(1).AddText(text)
builder.SaveFile("docx", "GetText.docx");
builder.CloseFile();
