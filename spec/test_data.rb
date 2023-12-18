# frozen_string_literal: true

# Test data for autotest
module TestData
  # CDE number formats (7.4.0)
  # @return [Array<String (frozen)>]
  def self.number_formats
    ['General',
     '0.00',
     '$#,##0.00',
     '_($* #,##0.00_)',
     'm/d/yyyy',
     '[$-F800]dddd, mmmm dd, yyyy',
     '[$-F400]h:mm:ss AM/PM',
     '0.00%',
     '0%',
     '# ?/?',
     '0.00E+00'].freeze
  end

  # CDE fill types
  # @return [Array<String (frozen)>]
  def self.fill_types
    %w[blipFill solid gradFill noFill pattFill gradFill]
  end

  # @return [Array<String (frozen)>]
  def self.libs
    %w[DjVuFile.dll
       docbuilder.com.dll
       docbuilder.net.dll
       doctrenderer.dll
       DocxRenderer.dll
       EpubFile.dll
       Fb2File.dll
       graphics.dll
       HtmlRenderer.dll
       icudt58.dll
       icuuc58.dll
       kernel.dll
       kernel_network.dll
       PdfFile.dll
       UnicodeConverter.dll
       XpsFile.dll]
  end
end
