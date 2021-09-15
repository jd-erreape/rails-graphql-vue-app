# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateReply do
  let(:instance) { described_class.new(object: nil, context: context, field: nil) }

  describe '#resolve' do
    subject(:resolve) { instance.resolve(replied_id: replied_id, body: body) }

    let(:user) { create(:user) }
    let(:replied) { create(:post, user: user) }
    let(:replied_id) { replied.id }
    let(:body) { 'This is a Post' }

    context 'when there is not an user logged in' do
      let(:context) { {} }

      it 'builds the errors' do
        expect(instance).to receive(:build_errors)

        resolve
      end
    end

    context 'when there is a user logged in' do
      let(:context) { { current_user: user } }

      context 'when the replied Post does not exists' do
        let(:replied_id) { -1 }

        it 'builds the proper error about the replied not existing' do
          expect(instance).to receive(:replied_not_found).with(replied_id)

          resolve
        end
      end

      context 'when the replied Post exists' do
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

          it 'assigns proper replied' do
            expect(resolve.replied).to eq(replied)
          end
        end
      end
    end
  end
end
