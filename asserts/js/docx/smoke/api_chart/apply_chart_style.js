builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oDrawing = Api.CreateChart("bar3D", [
    [200, 240, 280],
    [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands", 10);
oDrawing.SetHorAxisTitle("Year", 11);
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true, false);
oDrawing.SetTitle("Financial Overview", 13);
var oRGBColor1 = Api.CreateRGBColor(186, 217, 219);
var oRGBColor2 = Api.CreateRGBColor(93, 140, 143);
var oFill = Api.CreateSolidFill(oRGBColor1);
var oFillForStroke = Api.CreateSolidFill(oRGBColor2);
var oStroke = Api.CreateStroke(15000, oFillForStroke);
var aResults = [oDrawing.ApplyChartStyle(11),
                oDrawing.SetPlotAreaFill(oFill),
                oDrawing.SetPlotAreaOutLine(oStroke),
                oDrawing.SetSeriesFill(oFill, 0, false),
                oDrawing.SetSeriesOutLine(oStroke, 1, false),
                oDrawing.SetDataPointFill(oFill, 0, 0, false),
                oDrawing.SetDataPointOutLine(oStroke, 0, 0, false),
                oDrawing.SetTitleFill(oFill),
                oDrawing.SetTitleOutLine(oStroke),
                oDrawing.SetLegendFill(oFill),
                oDrawing.SetLegendOutLine(oStroke)];
oParagraph.AddDrawing(oDrawing);
aResults.forEach(function(item) {
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText(item.toString());
    oDocument.Push(oParagraph);
});
builder.SaveFile("docx", "ApplyChartStyle.docx");
builder.CloseFile();
