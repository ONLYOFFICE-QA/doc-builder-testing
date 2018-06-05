builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,2);
Slide.AddObject(Table);
Table.GetRow(0).GetCell(0).SetShd(Api.CreateSolidFill (Api.CreateRGBColor (255, 0, 0)));
builder.SaveFile("pptx", "SetShd.pptx");
builder.CloseFile();
