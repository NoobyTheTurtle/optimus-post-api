# frozen_string_literal: true

require 'rails_helper'

shared_context 'with save example response' do
  after do |example|
    content = example.metadata[:response][:content] || {}
    example_spec = {
      'application/json' => {
        examples: {
          test_example: {
            value: JSON.parse(response.body, symbolize_names: true)
          }
        }
      }
    }
    example.metadata[:response][:content] = content.deep_merge(example_spec)
  end
end
