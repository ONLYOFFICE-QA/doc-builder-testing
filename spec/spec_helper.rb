# frozen_string_literal: true

Encoding.default_external = Encoding::UTF_8
require 'rspec'
require 'test_data'
require 'bundler/setup'
require_relative '../lib/doc_builder_testing'
require_relative '../lib/custom_matchers'

# ENV['BUILDER_PLATFORM'] = 'WEB'
# ENV['WEB_BUILDER_URL'] = 'https://kim.teamlab.info/'
# ENV['WEB_BUILDER_URL'] = 'https://saul.teamlab.info'
# ENV['WEB_BUILDER_URL'] = 'https://doc-linux.teamlab.info'

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

# Print builder environment info after rspec summary
class BuilderInfoListener
  # @param _notification [RSpec::Core::Notifications::SummaryNotification]
  # @return [nil]
  def dump_summary(_notification)
    puts "BUILDER_PLATFORM: #{builder_platform}"
    puts "WEB_BUILDER_URL: #{builder.uri}" if web_builder?
    puts "Builder version: #{builder_version}"
  end

  private

  # @return [String] version of builder used in tests
  def builder_version
    version = web_builder? ? builder.version_with_build : builder.version
    version.to_s.strip
  rescue StandardError => e
    "unknown (#{e.message})"
  end
end

RSpec.configure do |config|
  config.reporter.register_listener(BuilderInfoListener.new, :dump_summary)
end
