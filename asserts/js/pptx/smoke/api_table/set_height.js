builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Slide.AddObject(Table);
Table.GetRow(0).SetHeight(10000000);
builder.SaveFile("pptx", "SetHeight.pptx");
builder.CloseFile();