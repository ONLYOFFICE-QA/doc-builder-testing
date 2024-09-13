from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
track_revisions = document.Call("IsTrackRevisions")
paragraph.Call("AddText", f"Paragraph is bool = {paragraph.IsBool()}")
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f"IsTrackRevisions is bool = {track_revisions.IsBool()}")

builder.SaveFile("docx", "IsBool.docx")
builder.CloseFile()
