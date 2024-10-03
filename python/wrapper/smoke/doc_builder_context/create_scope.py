from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext(False)
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "Without CreateScope script doesn't work")

scope.Close()
builder.SaveFile("docx", "CreateScope.docx")
builder.CloseFile()
