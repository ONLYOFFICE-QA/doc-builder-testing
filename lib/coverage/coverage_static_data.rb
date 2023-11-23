# frozen_string_literal: true

# Represents a container for static coverage calculation data
module CoverageStaticData
  # Global address to api builder method list after parse api.onlyoffice.com
  ADDRESS = 'https://raw.githubusercontent.com/ONLYOFFICE-QA/testing-api.onlyoffice.com/master/templates/document_builder/usage_api.json'

  # Representation of editors in remote source
  EDITORS = {
    'CDE' => 'Text document API',
    'CSE' => 'Spreadsheet API',
    'CPE' => 'Presentation API',
    'Form' => 'Form API'
  }.freeze

  # Pathways in the project to smoke
  SOURCES = {
    'CDE' => "#{Dir.pwd}/js/docx/smoke",
    'CSE' => "#{Dir.pwd}/js/xlsx/smoke",
    'CPE' => "#{Dir.pwd}/js/pptx/smoke",
    'Form' => "#{Dir.pwd}/js/form/smoke"
  }.freeze
end
