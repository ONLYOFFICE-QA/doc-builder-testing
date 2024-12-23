builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oMaster = oPresentation.GetMaster(0);
var oLayout = oMaster.GetLayout(0);
oLayout.SetName("SetName layout");
builder.SaveFile("pptx", "SetName.pptx");
builder.CloseFile();
