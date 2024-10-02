from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "If this paragraph is here, GetGlobal works")

builder.SaveFile("docx", "GetGlobal.docx")
builder.CloseFile()
