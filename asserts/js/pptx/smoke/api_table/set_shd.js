builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
Slide.RemoveAllObjects();
var Table = Api.CreateTable(3,3);
Table.SetShd(Api.CreateSolidFill (Api.CreateRGBColor (0, 255, 0)));
Slide.AddObject(Table);
builder.SaveFile("pptx", "SetShd.pptx");
builder.CloseFile();


