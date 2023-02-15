builder.CreateFile("docx");
    var odoc = Api.GetDocument();
    let arr_def_styles = ["Normal",
                    "No Spacing",
                    "Heading 1",
                    "Heading 2",
                    "Heading 3",
                    "Heading 4",
                    "Heading 5",
                    "Heading 6",
                    "Heading 7",
                    "Heading 8",
                    "Heading 9",
                    "Title",
                    "Subtitle",
                    "Quote",
                    "Intense Quote",
                    "List Paragraph",
                    "Caption",
                    "Header",
                    "Footer",
                    "Footnote text",
                    "Endnote text"]
    var result_json = {}
    arr_def_styles.forEach(el => {
        let st = odoc.GetStyle(el);
        let json = st.ToJSON()
            result_json[el] = json;
    });
GlobalVariable["JSON"] = JSON.stringify(result_json);
builder.CloseFile();

////////////////////////

builder.CreateFile("docx");
    var json = GlobalVariable["JSON"]
    var obj_json = JSON.parse(json)
    var odoc = Api.GetDocument();
    for(let k in obj_json){
        let st = Api.FromJSON(obj_json[k]);
        let opar = Api.CreateParagraph();
            opar.AddText(st.GetName())
            opar.SetStyle(st);
            odoc.Push(opar)
    }
    let opar = Api.CreateParagraph();
        opar.AddText(json);
        odoc.Push(opar)
builder.SaveFile("docx", "StyleToJSON.docx");
builder.CloseFile();
