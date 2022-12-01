builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange('C3').SetValue('1');
var used_range = oWorksheet.UsedRange.Count;
oWorksheet.GetRange('A1').SetValue(used_range);
builder.SaveFile("xlsx", "UsedRangeGetter.xlsx");
builder.CloseFile();
