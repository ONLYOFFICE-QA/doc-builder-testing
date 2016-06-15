
            var oDocument = Api.GetDocument();
oDocument.CreateNewHistoryPoint();
var oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
var oNoSpacingStyle = oDocument.GetStyle("No Spacing");
oTextPr.SetStyle(oNoSpacingStyle);
            