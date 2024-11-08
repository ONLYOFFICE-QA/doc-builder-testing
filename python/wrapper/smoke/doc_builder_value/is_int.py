from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
content = document.Call("GetContent")
count = document.Call("GetElementsCount")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", f"Content is int = {content.IsInt()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"ElementsCount is int = {count.IsInt()}")

builder.SaveFile("docx", "IsInt.docx")
builder.CloseFile()
