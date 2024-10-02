from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
text = paragraph.Call("GetText")
style = paragraph.Call("GetStyle")
paragraph.Call("AddText", f"Text is null = {text.IsNull()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Style is null = {style.IsNull()}")

builder.SaveFile("docx", "IsNull.docx")
builder.CloseFile()
