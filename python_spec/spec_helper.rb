# frozen_string_literal: true

Encoding.default_external = Encoding::UTF_8
require 'rspec'
require 'bundler/setup'
require_relative '../lib/doc_builder_testing'

# Get either DocBuilder of WebDocBuilder
# depending of env var
# @return [DocBuilderPythonWrapper]
def builder
  @builder ||= DocBuilderPythonWrapper.new
end
