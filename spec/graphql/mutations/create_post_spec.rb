# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreatePost do
  let(:instance) { described_class.new(object: nil, context: context, field: nil) }

  describe '#resolve' do
    subject(:resolve) { instance.resolve(body: body) }

    let(:body) { 'This is a Post' }

    context 'when there is not an user logged in' do
      let(:context) { {} }

      it 'builds the errors' do
        expect(instance).to receive(:build_errors)

        resolve
      end
    end

    context 'when there is a user logged in' do
      let(:user) { create(:user) }
      let(:context) { { current_user: user } }

      context 'when the parameters are not valid' do
        let(:body) { nil }

        it 'builds the errors' do
          expect(instance).to receive(:build_errors)

          resolve
        end
      end

      context 'when the parameters are valid' do
        it 'returns a post object' do
          expect(resolve.class).to eq(Post)
        end

        it 'persists the user' do
          expect(resolve).to be_persisted
        end

        it 'assigns proper attributes' do
          expect(resolve.body).to eq(body)
        end

        it 'assigns proper user' do
          expect(resolve.user).to eq(user)
        end
      end
    end
  end
end
