# frozen_string_literal: true

module QueryResolvers
  class CurrentUser
    ERROR_CODE = 'USER_NOT_LOGGED_IN'

    def initialize(context:)
      @context = context
    end

    def run
      context[:current_user] || error
    end

    private

    attr_reader :context

    def error
      context.add_error(
        GraphQL::ExecutionError.new(
          'User Not Logged In',
          extensions: { code: ERROR_CODE }
        )
      )
    end
  end
end
