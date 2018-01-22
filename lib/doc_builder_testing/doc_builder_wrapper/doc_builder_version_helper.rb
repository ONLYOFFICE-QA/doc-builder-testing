require 'semantic'

# Methods to working with version of Document Builder
module DocBuilderVersionHelper
  # @return [Semantic::Version] Semantic Version of builder
  def semver
    raw_version = version
    version_without_last = get_semver_values(raw_version)
    Semantic::Version.new(version_without_last)
  end

  private

  # Get semantic version values
  # @param version [String] 4 digits version
  # @return [String] clear version
  def get_semver_values(version)
    version.match(/\d+\.\d+.\d+/)[0]
  end
end
