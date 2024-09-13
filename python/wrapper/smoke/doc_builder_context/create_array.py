from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call('GetDocument')
paragraph1 = api.Call('CreateParagraph')
paragraph1.Call('SetSpacingAfter', 1000, False)
paragraph1.Call('AddText', 'CreateArray')
paragraph2 = api.Call('CreateParagraph')
paragraph2.Call('AddText', 'test')

content = context.CreateArray(2)
content[0] = paragraph1
content[1] = paragraph2
document.Call('InsertContent', content)

builder.SaveFile("docx", "CreateArray.docx")
builder.CloseFile()
