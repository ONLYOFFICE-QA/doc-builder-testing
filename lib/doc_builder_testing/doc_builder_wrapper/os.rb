# frozen_string_literal: true

# Module for working with different platforms
module OS
  # Check if platform is Windows
  # @return [TrueClass, FalseClass]
  def self.windows?
    RUBY_PLATFORM.include?('mswin') || RUBY_PLATFORM.include?('mingw')
  end

  # Check if platform is Mac
  #
  # @return [TrueClass, FalseClass]
  def self.mac?
    RUBY_PLATFORM.include?('darwin')
  end

  # Check if platform is Unix
  #
  # @return [TrueClass, FalseClass]
  def self.unix?
    !windows?
  end

  # Check if platform is Linux
  #
  # @return [TrueClass, FalseClass]
  def self.linux?
    unix? && !mac?
  end

  # Check if platform is JRuby
  #
  # @return [TrueClass, FalseClass]
  def self.jruby?
    RUBY_ENGINE == 'jruby'
  end

  # Check if platform is Rocky Linux
  #
  # @return [TrueClass, FalseClass]
  def self.rocky_linux?
    return false unless File.exist?('/etc/os-release')

    os_info = File.read('/etc/os-release')
    os_info.include?('Rocky Linux')
  end
end
