builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.AddComment("This is a comment.", "John", "uid-1");
Api.AddComment(oDocument, "This is another comment.", "Jane", "uid-2");

var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample paragraph.");
oParagraph.AddComment("Comment for paragraph", "Jane", "uid-2");
oParagraph.AddLineBreak();

var oRun = Api.CreateRun();
oRun.AddText("This is just a sample run. Nothing special.");
oParagraph.AddElement(oRun);
oRun.AddComment("Comment for run", "James", "uid-3");

oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph for range.");
oDocument.Push(oParagraph);
var oRange = oParagraph.GetRange(20, 29);
oRange.AddComment("Comment for range", "Julia", "uid-4");

var oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table");
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"));
var oTable = Api.CreateTable(3, 3);
oTable.SetWidth("percent", 100);
oTable.SetStyle(oTableStyle);
oDocument.Push(oTable);
oTable.AddComment("Comment for table", "John", "uid-1");

var oBlockLvlSdt = Api.CreateBlockLvlSdt();
oBlockLvlSdt.GetContent().GetElement(0).AddText("This is a block text content control.");
oDocument.Push(oBlockLvlSdt);
oBlockLvlSdt.AddComment("Comment for block content control", "James", "uid-3");

oParagraph = Api.CreateParagraph();
var oInlineLvlSdt = Api.CreateInlineLvlSdt();
oInlineLvlSdt.AddText("This is an inline text content control.");
oParagraph.AddInlineLvlSdt(oInlineLvlSdt);
oDocument.Push(oParagraph);
oInlineLvlSdt.AddComment("Comment for inline content control", "Julia", "uid-4");

var aComments = oDocument.GetAllComments();
var commentsArray = [];
for (var i=0; i<aComments.length; i++) {
    commentsArray.push(aComments[i].GetText());
}
oParagraph = Api.CreateParagraph();
oParagraph.AddText(commentsArray.join(", "));
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetAllComments.docx");
builder.CloseFile();
