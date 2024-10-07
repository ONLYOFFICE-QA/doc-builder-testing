from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
image = api.Call("CreateImage",
                 "https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png",
                 60 * 36000, 35 * 36000)
paragraph.Call("AddDrawing", image)
images = paragraph.Call("GetAllImages")
paragraph.Call("AddText", f"Images[0] is undefined = {images[0].IsUndefined()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"Images[1] is undefined = {images[1].IsUndefined()}")

builder.SaveFile("docx", "IsUndefined.docx")
builder.CloseFile()
