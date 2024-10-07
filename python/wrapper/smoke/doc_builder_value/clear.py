from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
new_paragraph = api.Call("CreateParagraph")
new_paragraph.Call("AddText", "some content")
paragraph.Call("AddText", f"before clear: {new_paragraph.IsEmpty()}")
paragraph.Call("AddLineBreak")
new_paragraph.Clear()
paragraph.Call("AddText", f"after clear: {new_paragraph.IsEmpty()}")

builder.SaveFile("docx", "Clear.docx")
builder.CloseFile()
