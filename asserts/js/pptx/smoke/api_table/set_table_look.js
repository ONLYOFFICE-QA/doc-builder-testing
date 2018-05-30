builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(3,3);
Table.SetTableLook(true, true, true, true, true, true);
Slide.AddObject(Table);
builder.SaveFile("pptx", "SetTableLook.pptx");
builder.CloseFile();