# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/AnyInstance
describe Mutations::SignInUser do
  let(:context) { instance_double(GraphQL::Query::Context, :[] => { session: {} }) }
  let(:instance) { described_class.new(object: nil, context: context, field: nil) }

  describe '#resolve' do
    subject(:resolve) { instance.resolve(credentials: credentials) }

    let(:password) { 'abc123' }
    let(:user) { create(:user, password: password) }

    context 'when the user provided exists' do
      context 'when the credentials are valid' do
        let(:credentials) { { email: user.email, password: password } }
        let(:token) { 'token' }

        before do
          # Stub token generation to verify the generated value
          allow_any_instance_of(ActiveSupport::MessageEncryptor)
            .to receive(:encrypt_and_sign).with("user-id:#{user.id}") { token }
        end

        it 'returns the user object with the generated token' do
          expect(resolve).to eq({ user: user, token: token })
        end

        it 'assigns the token to the session' do
          resolve

          expect(context[:session][:token]).to eq(token)
        end
      end

      context 'when the credentials are not valid' do
        let(:other_password) { '123abc' }
        let(:credentials) { { email: user.email, password: other_password } }

        it { is_expected.to be_nil }
      end
    end

    context 'when the user provided does not exist' do
      let(:credentials) { { email: 'non_existen@test.com', password: 'abc123' } }

      it { is_expected.to be_nil }
    end
  end
end
# rubocop:enable RSpec/AnyInstance
