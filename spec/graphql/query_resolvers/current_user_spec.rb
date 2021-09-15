# frozen_string_literal: true

require 'rails_helper'

describe QueryResolvers::CurrentUser do
  let(:context) { { current_user: user } }
  let(:instance) { described_class.new(context: context) }

  describe '#run' do
    subject(:current_user) { instance.run }

    context 'when there is a current user' do
      let(:user) { create(:user) }

      it { is_expected.to eq(user) }
    end

    context 'when there is not a current user' do
      let(:user) { nil }

      it 'returns an error' do
        expect(instance).to receive(:error)

        current_user
      end
    end
  end
end
