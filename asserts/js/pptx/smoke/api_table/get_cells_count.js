builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(3,1);
Slide.AddObject(Table);
var count = Table.GetRow(0).GetCellsCount();
Table.GetRow(0).GetCell(0).GetContent().GetElement(0).AddText(count + '');
builder.SaveFile("pptx", "GetCellsCount.pptx");
builder.CloseFile();
