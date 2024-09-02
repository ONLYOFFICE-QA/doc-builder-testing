from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

version = builder.GetVersion()
document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
paragraph.Call("SetSpacingAfter", 1000, False)
paragraph.Call("AddText", version.decode())

content = context.CreateArray(1)
content[0] = paragraph

document.Call("InsertContent", content)
builder.SaveFile("docx", "BaseExample.docx")
builder.CloseFile()
