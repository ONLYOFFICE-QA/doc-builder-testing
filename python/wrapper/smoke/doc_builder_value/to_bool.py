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
delete = comments[0].Call("Delete")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Delete result = {delete.ToBool()}")

builder.SaveFile("docx", "ToBool.docx")
builder.CloseFile()
