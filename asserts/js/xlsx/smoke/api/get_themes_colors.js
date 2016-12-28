builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var themes = Api.GetThemesColors();
for (var i = 0; i < themes.length; ++i) {
    oWorksheet.GetRange('A' + (i + 1)).SetValue(themes[i]);
}
builder.SaveFile("xlsx", "GetThemesColors.xlsx");
builder.CloseFile();