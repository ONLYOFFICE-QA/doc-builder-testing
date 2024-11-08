from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
wrong_call = document.Call("GetElmnt", 0)
paragraph.Call("AddText", f"Right call is empty = {paragraph.IsEmpty()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Wrong call is empty = {wrong_call.IsEmpty()}")

builder.SaveFile("docx", "IsEmpty.docx")
builder.CloseFile()
