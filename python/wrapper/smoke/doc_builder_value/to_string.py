from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "This is ToString method check")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'GetText ToString = {paragraph.Call("GetText").ToString()}')
paragraph.Call("GetText")

builder.SaveFile("docx", "ToString.docx")
builder.CloseFile()
