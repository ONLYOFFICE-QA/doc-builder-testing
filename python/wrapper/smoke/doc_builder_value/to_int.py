from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
content = document.Call("GetContent")
count = document.Call("GetElementsCount")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", f"ElementsCount = {count.ToInt()}")

builder.SaveFile("docx", "ToInt.docx")
builder.CloseFile()
