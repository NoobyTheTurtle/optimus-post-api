# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  path '/users/login' do
    post('Authenticate user') do
      tags 'Authenticate'
      produces 'application/json'
      consumes 'application/json'

      let(:user) { create(:user, password: '123456789Aa!') }

      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: 'string' },
          password: { type: 'string' }
        }
      }

      let(:params) { { email: user.email, password: password } }

      response(200, 'Successful') do
        let(:password) { '123456789Aa!' }
        include_context 'with save example response'

        schema auth_token: { type: 'string' }

        run_test!
      end

      response(401, 'Unauthorized') do
        let(:password) { 'testtest' }
        include_context 'with save example response'

        schema error: { type: 'string' }

        run_test!
      end
    end
  end
end
