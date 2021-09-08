# frozen_string_literal: true

module QueryResolvers
  class Messages
    def run
      [
        OpenStruct.new(id: 1, body: 'This is the first message'),
        OpenStruct.new(id: 2, body: 'This is the second message')
      ]
    end
  end
end
