
            var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTablePr;
var oNormalStyle = oDocument.GetDefaultStyle("table");
oTablePr = oNormalStyle.GetTablePr();
oTablePr.SetStyleRowBandSize(3);
            