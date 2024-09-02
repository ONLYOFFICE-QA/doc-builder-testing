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
text = comments[0].Call("GetText")
delete = comments[0].Call("Delete")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Text IsBool = {text.IsBool()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Delete result IsBool = {delete.IsBool()}")

builder.SaveFile("docx", "IsArray.docx")
builder.CloseFile()
