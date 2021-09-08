# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateUser do
  let(:instance) { described_class.new(object: nil, context: nil, field: nil) }

  describe '#resolve' do
    subject(:resolve) { instance.resolve(credentials: credentials) }

    context 'when the credentials provided are valid' do
      let(:credentials) { { email: 'test@test.com', password: 'abc123' } }

      it 'returns a user object' do
        expect(resolve.class).to eq(User)
      end

      it 'persists the user' do
        expect(resolve).to be_persisted
      end

      it 'assigns proper attributes' do
        expect(resolve.email).to eq(credentials[:email])
      end
    end

    context 'when the credentials provided are not valid' do
      let(:credentials) { { email: 'test', password: 'abc123' } }

      it 'builds the errors' do
        expect(instance).to receive(:build_errors)

        resolve
      end
    end
  end
end
