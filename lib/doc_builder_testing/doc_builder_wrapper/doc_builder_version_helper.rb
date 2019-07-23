# frozen_string_literal: true

require 'semantic'

# Methods to working with version of Document Builder
module DocBuilderVersionHelper
  # @return [Semantic::Version] Semantic Version of builder
  def semver
    raw_version = version
    version_without_last = get_sdk_semver(raw_version)
    Semantic::Version.new(version_without_last)
  end

  private

  # Get semantic version values
  # @param version [String] 4 digits version
  # @return [String] clear version
  def get_sdk_semver(version)
    version.lines.last.match(/\d+\.\d+.\d+/)[0]
  end
end
