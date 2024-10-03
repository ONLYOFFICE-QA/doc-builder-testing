from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext(False)
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
scope.Close()
paragraph.Call("AddText", "Without created scope script doesn't works")

builder.SaveFile("docx", "Close.docx")
builder.CloseFile()
