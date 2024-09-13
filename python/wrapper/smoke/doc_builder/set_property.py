import json
from python.docbuilder import builder
builder.SetProperty("--argument", json.dumps({"some key": "Some SetProperty value"}))
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
argument = globalObj['Argument']
paragraph.Call("AddText", argument["some key"].ToString())

content = context.CreateArray(1)
content[0] = paragraph

document.Call("InsertContent", content)
builder.SaveFile("docx", "SetProperty.docx")
builder.CloseFile()
