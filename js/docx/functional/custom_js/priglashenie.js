builder.CreateFile("docx");
var oDocument, oSection, oTextPr, oParaPr, oRun, oTable;
var oParagraph, oTableRow, oCell, oNumbering, oTablePr;
var oTableCellPr, oHeading1Style, oHeading2Style, oHeading3Style;
var oFill, oStroke, oDrawingRect, oNormalStyle;
var oParagraphInner;

oDocument = Api.GetDocument();

// page settings
oSection = oDocument.GetFinalSection();
oSection.SetPageMargins(1800, 1440, 1800, 1440);
oSection.SetPageSize(11909, 16834, true);
oSection.SetType("nextPage");

// default text properties
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetLanguage("ru-RU");
oTextPr.SetFontFamily("Arial");
oTextPr.SetSpacing(0);
oTextPr.SetPosition(0);
oTextPr.SetColor(0x07, 0x3A, 0x77, false);

// default paragraph properties
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetSpacingBefore(0);
oParaPr.SetSpacingAfter(0);
oParaPr.SetJc("left");

// heading 1 style
oHeading1Style = oDocument.CreateStyle("Heading 1 custom", "paragraph");

oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetFontSize(48);
oTextPr.SetFontFamily("Garamond");
oTextPr.SetColor(0x07, 0x3A, 0x77, false);

oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetSpacingLine(560, "exact");
oParaPr.SetJc("center");
oParaPr.SetSpacingBefore(180);

// heading 2 style
oHeading2Style = oDocument.CreateStyle("Heading 2 custom", "paragraph");

oTextPr = oHeading2Style.GetTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetFontFamily("Garamond");
oTextPr.SetColor(0x07, 0x3A, 0x77, false);

oParaPr = oHeading2Style.GetParaPr();
oParaPr.SetSpacingLine(280, "exact");
oParaPr.SetJc("center");
oParaPr.SetSpacingBefore(360);

// heading 3 style
oHeading3Style = oDocument.CreateStyle("Heading 3 custom", "paragraph");

oTextPr = oHeading3Style.GetTextPr();
oTextPr.SetFontSize(24);
oTextPr.SetFontFamily("Garamond");
oTextPr.SetColor(0x07, 0x3A, 0x77, false);
oTextPr.SetBold(true);

oParaPr = oHeading3Style.GetParaPr();
oParaPr.SetSpacingLine(280, "exact");
oParaPr.SetJc("center");
oParaPr.SetSpacingBefore(0);

// normal style
oNormalStyle = oDocument.CreateStyle("Normal custom", "paragraph");

oTextPr = oNormalStyle.GetTextPr();
oTextPr.SetFontSize(18);
oTextPr.SetFontFamily("Garamond");
oTextPr.SetColor(0x07, 0x3A, 0x77, false);

oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("center");
oParaPr.SetSpacingBefore(180);

// frame
oParagraph = oDocument.GetElement(0);
let oDrawing = Api.CreateImage("https://testing-documentserver-files.s3.amazonaws.com/png/d4623fd6-eec2-11e6-98a8-263e7d75e538.png", 2972435, 4286250);
oDrawing.SetWrappingStyle("behind");
oDrawing.SetHorPosition("page", 452118);
oDrawing.SetVerPosition("page", 463548);
oParagraph.AddDrawing(oDrawing);

// shape with text
oFill = Api.CreateNoFill();
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawingRect = Api.CreateShape("rect", 2514600, 3599815, oFill, oStroke);
oDrawingRect.SetWrappingStyle("square");
oDrawingRect.SetHorPosition("page", 685800);
oDrawingRect.SetVerPosition("page", 800100);

// paragraph_text
// heading 1
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oHeading1Style);
oParagraphInner.AddText("НАЗВАНИЕ");
oDrawingRect.GetDocContent().Push(oParagraphInner);

oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oHeading1Style);
oParagraphInner.AddText("ВАШЕГО");
oDrawingRect.GetDocContent().Push(oParagraphInner);

oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oHeading1Style);
oParagraphInner.AddText("МЕРОПРИЯТИЯ");
oDrawingRect.GetDocContent().Push(oParagraphInner);

// heading 2
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oHeading2Style);
oParagraphInner.AddText("24 cентября (воскресенье)");
oDrawingRect.GetDocContent().Push(oParagraphInner);

// heading 3
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oHeading3Style);
oParagraphInner.AddText("19:00");
oDrawingRect.GetDocContent().Push(oParagraphInner);

// normal
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oNormalStyle);
oRun = Api.CreateRun();
oRun.AddText("Приведите здесь дополнительные сведения о событии.");
oRun.AddLineBreak();
oRun.AddText("Можно поделиться сведениями о своей организации, о программе");
oRun.AddLineBreak();
oRun.AddText("мероприятия или укажите, что должны принести с собой посетители. Если дополнительных сведений о событии");
oRun.AddLineBreak();
oRun.AddText("предоставлять не нужно, удалите этот текст.");
oParagraphInner.AddElement(oRun);
oDrawingRect.GetDocContent().Push(oParagraphInner);

// italic normal
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oNormalStyle);
oRun = Api.CreateRun();
oRun.AddText("Москва, ул. Чехова 123, корп. 2");
oRun.SetItalic(true);
oParagraphInner.AddElement(oRun);
oDrawingRect.GetDocContent().Push(oParagraphInner);

// all caps normal
oParagraphInner = Api.CreateParagraph();
oParagraphInner.SetStyle(oNormalStyle);
oParagraphInner.SetSpacingBefore(0);
oRun = Api.CreateRun();
oRun.AddText("Название организации");
oRun.SetCaps(true);
oParagraphInner.AddElement(oRun);
oDrawingRect.GetDocContent().Push(oParagraphInner);

// KnV coding style: removing 1st element 'empty paragraph'
oDrawingRect.GetDocContent().RemoveElement(0);

oParagraph = Api.CreateParagraph();
oParagraph.AddDrawing(oDrawingRect);
oDocument.Push(oParagraph);

builder.SaveFile("docx", "priglashenie.docx");
builder.CloseFile();
