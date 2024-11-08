from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
track_revisions = document.Call("IsTrackRevisions")
paragraph.Call("AddText", f"IsTrackRevisions = {track_revisions.ToBool()}")

builder.SaveFile("docx", "ToBool.docx")
builder.CloseFile()
