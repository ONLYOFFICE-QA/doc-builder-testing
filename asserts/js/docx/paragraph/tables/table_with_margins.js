builder.CreateFile("docx");
var oDocument     = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTable = Api.CreateTable(3, 3);
oDocument.Push(oTable);
oTable.SetTableInd(1000);
oTable.SetTableCellMarginBottom(200);
oTable.SetTableCellMarginTop(100);
oTable.SetTableCellMarginLeft(400);
oTable.SetTableCellMarginRight(200);
oTable.SetCellSpacing(200);

builder.SaveFile("docx", "table_with_margins.docx");
builder.CloseFile();

