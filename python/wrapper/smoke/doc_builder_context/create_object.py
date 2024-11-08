from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
value = context.CreateObject()
paragraph.Call("AddText", f"Value is object = {value.IsObject()}")

builder.SaveFile("docx", "CreateObject.docx")
builder.CloseFile()
