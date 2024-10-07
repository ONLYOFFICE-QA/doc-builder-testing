from python.docbuilder import builder
builder.OpenFile("assets/python_wrapper_test_files/OpenFile.docx",
                 "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>")
builder.SaveFile("docx", "OpenFile.docx")
builder.CloseFile()
