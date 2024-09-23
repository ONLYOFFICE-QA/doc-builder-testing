from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
paragraph.Call("AddText", "Some text for Get method")

paragraphs = document.Call("GetAllParagraphs")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'Text is {paragraphs.Get(0).Call("GetText").ToString()}')

builder.SaveFile("docx", "Get.docx")
builder.CloseFile()
