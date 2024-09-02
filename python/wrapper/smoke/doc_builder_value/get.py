from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "Some text")
paragraph.Call("AddComment", "Comment one", "John", "uid-1")

comments = document.Call("GetAllComments")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Comment text is {comments.Get(0).Call("GetText").ToString()}")

builder.SaveFile("docx", "IsArray.docx")
builder.CloseFile()
