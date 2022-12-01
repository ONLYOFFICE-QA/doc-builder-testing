builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(2,2);
Slide.AddObject(Table);
builder.SaveFile("pptx", "CreateTable.pptx");
builder.CloseFile();
