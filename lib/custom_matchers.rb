# frozen_string_literal: true

RSpec::Matchers.define :hash_have_no_empty_string_values do
  match do |hash|
    @invalid_types = {}
    @empty_strings = {}

    hash.each do |key, value|
      if !value.is_a?(String)
        @invalid_types[key] = value.class
      elsif value.empty?
        @empty_strings[key] = value
      end
    end

    @invalid_types.empty? && @empty_strings.empty?
  end

  failure_message do
    messages = []

    if @invalid_types.any?
      invalid_types_message = @invalid_types.map { |key, type| "#{key}: #{type}" }.join(', ')
      messages << "found non-string values: #{invalid_types_message}"
    end

    if @empty_strings.any?
      empty_strings_message = @empty_strings.keys.join(', ')
      messages << "found empty strings for keys: #{empty_strings_message}"
    end

    "expected hash to have only non-empty string values, but #{messages}"
  end
end
