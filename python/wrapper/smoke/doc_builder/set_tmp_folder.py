from python.docbuilder import builder

builder.SetTmpFolder("/tmp/folder")
builder.CreateFile("docx")

context = builder.GetContext(False)
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
scope.Close()
paragraph.Call("AddText", "Hello, World!")
