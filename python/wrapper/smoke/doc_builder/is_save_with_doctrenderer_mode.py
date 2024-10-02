import json
from python.docbuilder import builder
builder.SetProperty('--use-doctrenderer-scheme', 'true')
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", f"IsSaveWithDoctrendererMode = {builder.IsSaveWithDoctrendererMode()}")

builder.SaveFile("docx", "IsSaveWithDoctrendererMode.docx")
builder.CloseFile()
