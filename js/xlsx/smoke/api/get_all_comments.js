builder.CreateFile("xlsx");
Api.AddComment("This is a comment.", "John Smith", "uid-1");
Api.AddComment("This is another comment.", "Mark Potato", "uid-2");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A2");
oRange.AddComment("Comment for range", "James", "uid-3");

var arrComments = Api.GetAllComments();
var commentsArray = [];
for (var i=0; i<arrComments.length; i++) {
    commentsArray.push(arrComments[i].GetText());
}
oWorksheet.GetRange("A1").SetValue(commentsArray.join(", "));
builder.SaveFile("xlsx", "GetAllComments.xlsx");
builder.CloseFile();
