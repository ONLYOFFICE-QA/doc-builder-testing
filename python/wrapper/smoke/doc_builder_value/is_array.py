from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
run1 = api.Call("CreateRun")
run1.Call("AddText", "First run")
paragraph.Call("AddElement", run1)
run1.Call("AddComment", "Comment one", "John", "uid-1")

comments = document.Call("GetAllComments")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Comments IsArray = {comments.IsArray()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Comment IsArray = {comments[0].IsArray()}")

builder.SaveFile("docx", "IsArray.docx")
builder.CloseFile()
