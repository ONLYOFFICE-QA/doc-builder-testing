from python.docbuilder import builder
builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()
globalObj = context.GetGlobal()
api = globalObj["Api"]

document = api.Call("GetDocument")
paragraph = document.Call("GetElement", 0)
class_type = paragraph.Call("GetClassType")
charts = paragraph.Call("GetAllCharts")
paragraph.Call("AddText", f'ClassType is string = {class_type.IsString()}')
paragraph.Call("AddLineBreak")
paragraph.Call("AddText", f'Charts is string = {charts.IsString()}')

builder.SaveFile("docx", "IsString.docx")
builder.CloseFile()
