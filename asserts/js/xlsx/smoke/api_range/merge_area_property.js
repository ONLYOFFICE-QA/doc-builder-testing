builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1:C3").Merge();
var count = oWorksheet.GetRange('A1').MergeArea.Count;
oWorksheet.GetRange('A4').SetValue(count);
builder.SaveFile("xlsx", "MergeArea.xlsx");
builder.CloseFile();
