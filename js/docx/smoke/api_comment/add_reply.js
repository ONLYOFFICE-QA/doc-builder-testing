builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just AddReply method test");
Api.AddComment(oParagraph, "comment", "John Smith");
var aComments = oDocument.GetAllComments();
aComments[0].AddReply("reply to comment", "Mark Potato", "uid-2", 0);
builder.SaveFile("docx", "AddReply.docx");
builder.CloseFile();
