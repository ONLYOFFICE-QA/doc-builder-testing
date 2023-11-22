builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
// Создаем градиентный цвет
var oRGBColor = Api.CreateRGBColor(255, 164, 101);
var oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("lightYellow"), 0);
var oGs2 = Api.CreateGradientStop(oRGBColor, 100000);
var oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
// Добавляем прямоугольную форму в параграф
oParagraph.AddDrawing(oDrawing);
// Получаем тип класса цвета
var oClassType = oRGBColor.GetClassType();
// Создаем новый параграф и добавляем в него информацию о классе цвета
var oNewParagraph = Api.CreateParagraph();
oNewParagraph.AddText("Class Type = " + oClassType);
// Добавляем новый параграф в документ
oDocument.Push(oNewParagraph);
// Преобразуем в JSON
var json = oDocument.ToJSON(false, false, false, false, false, false);
GlobalVariable["JSON"] = json;
builder.CloseFile();


/////////////////////////

builder.CreateFile("docx");
var oDocument = Api.GetDocument();

// Получаем JSON из глобальной переменной
var json = GlobalVariable["JSON"];

// Создаем первый параграф и добавляем текст из JSON в него
var oFirstParagraph = Api.CreateParagraph();
oFirstParagraph.AddText(json);
// Добавляем первый параграф в документ
oDocument.Push(oFirstParagraph);
// Создаем новый параграф из JSON
var oParagraphFromJSON = Api.CreateParagraph();
oParagraphFromJSON.FromJSON(json);
// Добавляем новый параграф с текстом из JSON в документ
oDocument.Push(oParagraphFromJSON);
// Сохраняем результат в файл
builder.SaveFile("docx", "RGBToJSON.docx");
builder.CloseFile();
