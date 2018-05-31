builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Slide.AddObject(Table);
Table.GetRow(0).GetCell(0).SetCellBorderTop(5, Api.CreateSolidFill (Api.CreateRGBColor (255, 0, 0)));
builder.SaveFile("pptx", "SetCellBorderTop.pptx");
builder.CloseFile();