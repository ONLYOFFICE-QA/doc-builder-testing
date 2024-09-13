from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
track_revisions = document.Call("IsTrackRevisions")
paragraph.Call("AddText", f"Paragraph is object = {paragraph.IsObject()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"IsTrackRevisions is object = {track_revisions.IsObject()}")

builder.SaveFile("docx", "IsObject.docx")
builder.CloseFile()
