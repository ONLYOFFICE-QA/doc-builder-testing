builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Slide.AddObject(Table);
var class_name = Table.GetRow(0).GetCell(0).GetClassType();
Table.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText(class_name);
builder.SaveFile("pptx", "GetClassType.pptx");
builder.CloseFile();
