from python.docbuilder import builder
builder.CreateFile("docx")
context = builder.GetContext()
globalObj = context.GetGlobal()
builder.SaveFile("docx", "BaseExample.docx")
builder.CloseFile()
