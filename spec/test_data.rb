# frozen_string_literal: true

# Test data for autotest
module TestData
  # CDE number formats (7.4.0)
  def self.number_formats
    ['General', '0.00', '$#,##0.00', '_($* #,##0.00_)', 'm/d/yyyy',
     '[$-F800]dddd, mmmm dd, yyyy', '[$-F400]h:mm:ss AM/PM',
     '0.00%', '0%', '# ?/?', '0.00E+00'].freeze
  end
end
