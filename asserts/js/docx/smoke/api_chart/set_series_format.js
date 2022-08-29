builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oDrawing = Api.CreateChart("bar3D", [
        [200, 240, 280],
        [250, 260, 280]
    ],
    ["Projected Revenue", "Estimated Costs"],
    [2014, 2015, 2016],
    4051300,
    2347595,
    24,
    ["General", "#,##0.00_);[Red](#,##0.00)"]);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands", 10);
oDrawing.SetHorAxisTitle("Year", 11);
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true, false);
oDrawing.SetTitle("Financial Overview", 13);
oDrawing.SetAxieNumFormat("0.00E+00", "left");
oDrawing.SetDataPointNumFormat("0.00E+00", 0, 1, true);
oDrawing.SetSeriaNumFormat("0.00E+00", 0);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "SetSeriesFormat.docx");
builder.CloseFile();
