builder.CreateFile("xlsx");
    var oWorksheet = Api.GetActiveSheet();
        oWorksheet.GetCells(1, 1).SetValue('first cell');
builder.SaveFile("xlsx", "First_cell.xlsx");
builder.CloseFile();
