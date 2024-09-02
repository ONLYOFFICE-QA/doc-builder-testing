from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "This is IsString method check")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'GetText is string = {paragraph.Call("GetText").IsString()}')
paragraph.Call("GetText")

builder.SaveFile("docx", "IsString.docx")
builder.CloseFile()
