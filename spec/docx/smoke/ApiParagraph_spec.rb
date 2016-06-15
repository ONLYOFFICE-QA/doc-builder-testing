require 'bundler/setup'
require 'rspec'
require_relative '../../../lib/doc_builder_testing'
describe 'ApiParagraph sectin tests' do
  it 'AddColumnBreak method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addcolumnbreak.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddDrawing method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/adddrawing.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddLineBreak method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addlinebreak.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddPageBreak method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addpagebreak.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddTabStop method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtabstop.js')
      expect(docx.nil?).to eq(false)
  end

  it 'AddText method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/addtext.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetClassType method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getclasstype.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetElementsCount method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getelementscount.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetNumbering method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getnumbering.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetParagraphMarkTextPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparagraphmarktextpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'GetParaPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/getparapr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'RemoveAllElements method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeallelements.js')
      expect(docx.nil?).to eq(false)
  end

  it 'RemoveElement method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/removeelement.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetBetweenBorder method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbetweenborder.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetBottomBorder method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setbottomborder.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetContextualSpacing method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setcontextualspacing.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetIndFirstLine method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindfirstline.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetIndLeft method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindleft.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetIndRight method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setindright.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetJc method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setjc.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetKeepLines method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeeplines.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetKeepNext method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setkeepnext.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetLeftBorder method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setleftborder.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetNumbering method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumbering.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetNumPr method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setnumpr.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetPageBreakBefore method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setpagebreakbefore.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetRightBorder method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setrightborder.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetShd method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setshd.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingAfter method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingafter.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingBefore method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingbefore.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetSpacingLine method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setspacingline.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetStyle method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setstyle.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTabs method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settabs.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetTopBorder method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/settopborder.js')
      expect(docx.nil?).to eq(false)
  end

  it 'SetWidowControl method' do
      docx = DocBuilderWrapper.new.build_doc_and_parse('asserts/js/docx/smoke/ApiParagraph/setwidowcontrol.js')
      expect(docx.nil?).to eq(false)
  end

end