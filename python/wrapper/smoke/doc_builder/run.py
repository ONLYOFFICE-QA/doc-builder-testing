from python.docbuilder import builder
builder.CreateFile("docx")
builder.Run("python/test_files/run.docbuilder")
builder.SaveFile("docx", "Run.docx")
builder.CloseFile()
