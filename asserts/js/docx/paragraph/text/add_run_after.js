builder.CreateFile("docx");

var Api = editor;
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();

var oParagraph, oTable, oTableRow, oCell, oCellContent, oRun, oDrawing;

  oParagraph = Api.CreateParagraph();
    oDocument.Push(oParagraph);
    oRun = Api.CreateRun();
    oParagraph.AddElement(oRun);
    oRun.AddText("Run");
    oRun.AddTabStop();
     oRun.AddText("StopRun");
 

builder.SaveFile("docx", "add_run_after.docx");
builder.CloseFile();

