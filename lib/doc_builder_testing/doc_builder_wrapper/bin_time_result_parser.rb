# frozen_string_literal: true

# Parse result of /bin/time -v execution
class BinTimeResultParser
  def initialize(result)
    @result = result
  end

  # @return [Integer] total memory usage
  def memory
    memory_line = @result.split("\n").find { |line| line.include?('Maximum resident set') }
    memory_line.scan(/\d/).join.to_i
  end

  # @return [Integer] user time
  def user_time
    time_line = @result.split("\n").find { |line| line.include?('User time') }
    time_line.split(':').last.to_f
  end
end
