# frozen_string_literal: true

class DocBuilderError < StandardError; end
class WebDocBuilderError < StandardError; end
class EmptyUrlsInWebBuilderResponse < WebDocBuilderError; end
class DocBuilderFileCreationError < StandardError; end
