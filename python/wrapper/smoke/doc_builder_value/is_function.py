from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
obj = globalObj['Object']

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", f'globalObj["Api"] is undefined = {api.IsFunction()}')
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'globalObj["Object"] is undefined = {obj.IsFunction()}')

builder.SaveFile("docx", "IsFunction.docx")
builder.CloseFile()
