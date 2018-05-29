builder.CreateFile("pptx");
var Presentation = Api.GetPresentation();
var Slide = Presentation.GetSlideByIndex(0);
var Table = Api.CreateTable(1,1);
Table.AddColumn();
Slide.AddObject(Table);
Table.GetRow(0).GetCell(1).GetContent().GetElement(0).AddText('added_column');
builder.SaveFile("pptx", "AddColumn.pptx");
builder.CloseFile();