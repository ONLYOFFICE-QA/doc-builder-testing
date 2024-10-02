from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
color = context.CreateObject()
color['type'] = 'uniColor'
document.SetProperty("color", color)
color = document.GetProperty("color")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", f"Color is {color['type'].ToString()}")

builder.SaveFile("docx", "GetProperty.docx")
builder.CloseFile()
