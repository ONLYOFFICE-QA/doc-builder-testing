builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

for (var nIndex = 0; nIndex < 3; ++nIndex)
    {
        oParagraph = Api.CreateParagraph();
        oDocument.Push(oParagraph);
        oParagraph.AddText("Borders");

        oParagraph.SetTopBorder("single", 24, 0, 255, 0, 0);
        oParagraph.SetBottomBorder("single", 24, 0, 0, 255, 0);
        oParagraph.SetLeftBorder("single", 48, 0, 0, 0, 255);
        oParagraph.SetRightBorder("single", 48, 0, 255, 255, 0);
        oParagraph.SetBetweenBorder("single", 36, 0, 255, 0, 255);
    }


builder.SaveFile("docx", "add_text_with_borders.docx");
builder.CloseFile();