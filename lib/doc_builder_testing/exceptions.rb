# frozen_string_literal: true

# Class for any exception in DocBuilder
class DocBuilderError < StandardError; end

# Class for any exception in WebDocBuilder
class WebDocBuilderError < StandardError; end

# Class for error if WebDocBuilder return empty urls
class EmptyUrlsInWebBuilderResponse < WebDocBuilderError; end

# Class for error if DocBuilder cannot create file
class DocBuilderFileCreationError < StandardError; end
