builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,3);
Slide.AddObject(Table);
var row1 = Table.GetRow(0);
var row2 = Table.GetRow(2);
row1.GetCell(0).GetContent().GetElement(0).AddText('row1');
row2.GetCell(0).GetContent().GetElement(0).AddText('row2');
builder.SaveFile("pptx", "GetRow.pptx");
builder.CloseFile();