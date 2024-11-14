# frozen_string_literal: true

Encoding.default_external = Encoding::UTF_8
require 'rspec'
require 'test_data'
require 'bundler/setup'
require_relative '../lib/doc_builder_testing'
require_relative '../lib/custom_matchers'

# ENV['BUILDER_PLATFORM'] = 'WEB'
# ENV['WEB_BUILDER_URL'] = 'https://kim.teamlab.info/'

# Get either DocBuilder of WebDocBuilder
# depending of env var
# @return [WebDocBuilderWrapper, DocBuilderWrapper]
def builder
  @builder ||= if web_builder?
                 WebDocBuilderWrapper.new
               else
                 DocBuilderWrapper.new
               end
end

# @return [String] which platform is used to run builder tests
def builder_platform
  ENV.fetch('BUILDER_PLATFORM', 'DESKTOP')
end

# Check if platform for builder is web
# @return [Boolean] result of check
def web_builder?
  builder_platform == 'WEB'
end

# Settings for import docbuilder.py in test scripts
ENV['PYTHONPATH'] = Dir.pwd

# Get DocBuilderPythonWrapper
# @return [DocBuilderPythonWrapper]
def python_builder
  @python_builder ||= DocBuilderPythonWrapper.new
end
