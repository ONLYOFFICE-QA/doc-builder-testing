builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(3,1);
Table.RemoveColumn(Table.GetRow(0).GetCell(0));
Slide.AddObject(Table);
builder.SaveFile("pptx", "RemoveColumn.pptx");
builder.CloseFile();
