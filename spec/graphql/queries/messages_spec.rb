# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
describe 'Messages Query' do
  describe 'execution' do
    subject(:messages) do
      RailsGraphqlVueAppSchema
        .execute(query_string)
        .to_h
        .dig('data', 'messages')
    end

    let(:attributes) { %w[id body] }
    let(:query_string) do
      %(
        query {
          messages {
            #{attributes.join(' ')}
          }
        }
      )
    end

    it 'returns an array' do
      expect(messages.class).to eq(Array)
    end

    it 'contains proper attributes for each element' do
      # TODO: This will change once we introduce proper AR Messages
      # We will verify the length is the one of the fixtures we will
      # create and also verify the content
      messages.each { |message| expect(message.keys).to eq(attributes) }
    end
  end
end
# rubocop:enable RSpec/DescribeClass
