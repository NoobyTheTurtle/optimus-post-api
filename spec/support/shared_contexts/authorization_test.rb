# frozen_string_literal: true

require 'rails_helper'

shared_context 'with authorization' do
  security [Bearer: {}]
  let(:auth_user) { create(:user) }
  let(:Authorization) { "Bearer #{JsonWebToken.encode({ user_id: auth_user.id })}" }
end
