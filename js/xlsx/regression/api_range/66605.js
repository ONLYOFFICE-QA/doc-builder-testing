builder.OpenFile("assets/api_spreadsheets_files/recalculate.xlsx");
    const ws = Api.GetSheet('Sheet1');
        Api.AddSheet('Sheet3');
    const newWS = Api.GetActiveSheet();
    const textRange = "A1:E9";
    const rangeFrom = ws.GetRange(textRange);
    const rangeTo = newWS.GetRange(textRange);
        rangeTo.Paste(rangeFrom);
    const BRange = newWS.GetRange('B1:B9');
    var i = 1;
    BRange.ForEach(function (range) {
        range.SetValue(i);
        i++;
    });
    const zeroRange = newWS.GetRange('D1:D9');
        zeroRange.SetValue(0);
    var fLogger = function(oLogger){
        console.log(oLogger)
        newWS.GetRange('A11').SetValue(
            JSON.stringify(oLogger)
        )
    };
    var bReturn  = Api.RecalculateAllFormulas(fLogger);
        console.log(bReturn)
        newWS.GetRange('A12').SetValue(String(bReturn))
builder.SaveFile("xlsx", "recalculate.xlsx");
builder.CloseFile();
