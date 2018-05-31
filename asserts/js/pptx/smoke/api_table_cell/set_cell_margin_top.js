builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Slide.AddObject(Table);
Table.GetRow(0).GetCell(0).SetCellMarginTop(1000);
builder.SaveFile("pptx", "SetCellMarginTop.pptx");
builder.CloseFile();