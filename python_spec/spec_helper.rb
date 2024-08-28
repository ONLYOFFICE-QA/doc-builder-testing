# frozen_string_literal: true

require 'rspec'
require 'bundler/setup'
require_relative '../lib/doc_builder_testing'

# Settings for import docbuilder.py in test scripts
ENV['PYTHONPATH'] = Dir.pwd

# Get DocBuilderPythonWrapper
# @return [DocBuilderPythonWrapper]
def builder
  @builder ||= DocBuilderPythonWrapper.new
end
