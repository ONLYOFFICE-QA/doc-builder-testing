from python.docbuilder import builder
builder.CreateFile("docx")
builder.Run("assets/python_wrapper_test_files/run.docbuilder")
builder.SaveFile("docx", "Run.docx")
builder.CloseFile()
