# frozen_string_literal: true

require 'rails_helper'

describe Mutations::SignOutUser do
  let(:context) { { session: { token: '123' } } }
  let(:instance) { described_class.new(object: nil, context: context, field: nil) }

  describe '#resolve' do
    subject(:resolve) { instance.resolve }

    it 'removes the user token from the session' do
      resolve

      expect(context[:session][:token]).to be_nil
    end
  end
end
