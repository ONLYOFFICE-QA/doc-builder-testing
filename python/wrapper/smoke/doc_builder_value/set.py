from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call('GetDocument')
paragraph1 = api.Call('CreateParagraph')
paragraph1.Call('AddText', 'Set')
paragraph2 = api.Call('CreateParagraph')
paragraph2.Call('AddText', 'method test')

content = context.CreateArray(2)
content.Set(1, paragraph1)
content.Set(2, paragraph2)
document.Call('InsertContent', content)

builder.SaveFile("docx", "Set.docx")
builder.CloseFile()
