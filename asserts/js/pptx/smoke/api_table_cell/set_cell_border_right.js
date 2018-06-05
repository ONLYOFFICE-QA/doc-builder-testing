builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Slide.AddObject(Table);
Table.GetRow(0).GetCell(0).SetCellBorderRight(5, Api.CreateSolidFill (Api.CreateRGBColor (255, 0, 0)));
builder.SaveFile("pptx", "SetCellBorderRight.pptx");
builder.CloseFile();
