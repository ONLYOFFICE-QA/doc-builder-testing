from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
image = api.Call("CreateImage",
                 "https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png",
                 60 * 36000, 35 * 36000)
paragraph.Call("AddDrawing", image)
paragraph.Call("AddText", f"Width is double = {image.Call("GetWidth").IsDouble()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"LockValue is double = {image.Call("GetLockValue").IsDouble()}")

builder.SaveFile("docx", "IsDouble.docx")
builder.CloseFile()
