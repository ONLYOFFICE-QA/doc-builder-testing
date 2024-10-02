from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
value = context.CreateNull()
paragraph.Call("AddText", f"Value is null = {value.IsNull()}")

builder.SaveFile("docx", "CreateNull.docx")
builder.CloseFile()
