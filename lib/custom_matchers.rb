# frozen_string_literal: true

RSpec::Matchers.define :have_no_empty_string_values do
  match do |hash|
    hash.values.none?(&:empty?)
  end

  failure_message do |hash|
    "expected hash to have no empty string values, but found #{hash.select { |_k, v| v.to_s.empty? }.keys.join(', ')}"
  end
end
