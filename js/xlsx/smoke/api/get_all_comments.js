builder.CreateFile("xlsx");
Api.AddComment("This is a comment.", "John Smith", "uid-1");
Api.AddComment("This is another comment.", "Mark Potato", "uid-2");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("D1");
oRange.AddComment("Comment for range", "James", "uid-3");

var arrComments = Api.GetAllComments();
var commentsArray = [];
for (var i=0; i<arrComments.length; i++) {
    oWorksheet.GetRange("A" + (i+1)).SetValue(arrComments[i].GetAuthorName() + ":" + arrComments[i].GetText());
}
builder.SaveFile("xlsx", "GetAllComments.xlsx");
builder.CloseFile();
