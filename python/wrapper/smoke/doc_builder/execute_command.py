from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

builder.ExecuteCommand('Argument = {"some key": "Some ExecuteCommand value"}')
document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
argument = globalObj['Argument']
paragraph.Call("AddText", argument["some key"].ToString())

content = context.CreateArray(1)
content[0] = paragraph
document.Call("InsertContent", content)

builder.SaveFile("docx", "ExecuteCommand.docx")
builder.CloseFile()
