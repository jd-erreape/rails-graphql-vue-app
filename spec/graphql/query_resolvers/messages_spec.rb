# frozen_string_literal: true

require 'rails_helper'

describe QueryResolvers::Messages do
  let(:instance) { described_class.new }

  describe '#run' do
    subject(:messages) { instance.run }

    it 'returns an array' do
      expect(messages.class).to eq(Array)
    end

    it 'contains objects of the proper class' do
      # TODO: This will change once we introduce proper AR Messages
      messages.each { |message| expect(message.class).to eq(OpenStruct) }
    end
  end
end
