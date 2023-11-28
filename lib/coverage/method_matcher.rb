# frozen_string_literal: true

# Represents a class describing the logic of recursive file system traversal
# For example, let's take a test tree of the file system
#
# ./assets
# .
# ├── api_scripts
# │ ├── DocumentWithComments.txt
# │ └── DocumentWithReview.txt
# ├── archive_scripts
# │ └── archive.js
# ├── simple_scripts
# │ ├── simple.js
# └── unit
#     └── simple_incorrect_script
#
# @!method recursive_search(regexp, path)
# Having received the path to ./assets in path, the algorithm will
# traverse the whole file system first in depth and then in width
# and read each inserted file line by line.
#
# And if it finds at least one match with regexp in a line,
# it will change the state of the global flag.
class MethodMatcher
  def initialize(chars, path)
    @pattern_found = false
    recursive_search(/#{chars}\(.*\)/, path)
  end

  # @return [TrueClass, FalseClass]
  def pattern_found?
    @pattern_found
  end

  private

  # @param [Regexp] regexp
  # @param [String] node
  # @return [Dir, TrueClass, FalseClass]
  def recursive_search(regexp, node)
    if File.file?(node)
      contains_matches?(regexp, node)
      return @pattern_found
    end

    dir_instance = Dir.new(node)
    dir_instance.each_child do |child|
      recursive_search(regexp, File.join(dir_instance.path.to_s, child))
    end
  end

  # @param [Regexp] regexp
  # @param [String] path
  # @return [Object]
  def contains_matches?(regexp, path)
    File.open(path.to_s, 'r') do |file|
      file.each_line do |line|
        next unless line.match?(regexp)

        @pattern_found = true # Switch global flag if pattern is found
        break
      end
    end
  end
end
