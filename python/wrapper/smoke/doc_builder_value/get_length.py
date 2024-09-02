from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
run1 = api.Call("CreateRun")
run1.Call("AddText", "First run")
paragraph.Call("AddElement", run1)
run1.Call("AddComment", "Comment one", "John", "uid-1")
paragraph.Call("AddLineBreak")
run2 = api.Call("CreateRun")
run2.Call("AddText", "Second run")
paragraph.Call("AddElement", run2)
run2.Call("AddComment", "Comment two", "Jane", "uid-2")

comments = document.Call("GetAllComments")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Comments GetLength = {comments.GetLength()}")

builder.SaveFile("docx", "GetLength.docx")
builder.CloseFile()
