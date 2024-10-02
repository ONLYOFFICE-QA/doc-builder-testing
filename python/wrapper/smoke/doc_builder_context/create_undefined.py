from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
value = context.CreateUndefined()
paragraph.Call("AddText", f"Value is undefined = {value.IsUndefined()}")

builder.SaveFile("docx", "CreateUndefined.docx")
builder.CloseFile()
