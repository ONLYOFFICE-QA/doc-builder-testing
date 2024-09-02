from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
value1 = context.CreateNull()
value2 = context.CreateObject()
paragraph.Call("AddText", f"Value 1 is null = {value.IsNull()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Value 2 is null = {value.IsNull()}")

builder.SaveFile("docx", "BaseExample.docx")
builder.CloseFile()
