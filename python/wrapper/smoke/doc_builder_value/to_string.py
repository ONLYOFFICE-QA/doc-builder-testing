from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
run = paragraph.Call("AddText", "This is ToString method check")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'GetText ToString = {run.Call("GetText").ToString()}')

builder.SaveFile("docx", "ToString.docx")
builder.CloseFile()
