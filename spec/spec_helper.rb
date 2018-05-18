Encoding.default_external = Encoding::UTF_8
require 'bundler/setup'
require 'rspec'
require_relative '../lib/doc_builder_testing.rb'

RSpec.configure { |c| c.fail_fast = true }

def builder
  @builder ||= if ENV['BUILDER_PLATFORM'] == 'WEB'
                 WebDocBuilderWrapper.new
               else
                 DocBuilderWrapper.new
               end
end
