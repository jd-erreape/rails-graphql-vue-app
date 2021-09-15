# frozen_string_literal: true

module Mutations
  class CreateReply < BaseMutation
    REPLIED_NOT_FOUND_ERROR_CODE = 'REPLIED_NOT_FOUND_ERROR_CODE'

    argument :replied_id, Integer, required: true
    argument :body, String, required: true

    type Types::PostType

    def resolve(replied_id:, body:)
      with_error_check do
        replied = Post.find_by(id: replied_id)

        return replied_not_found(replied_id) unless replied

        Post.create(
          body: body,
          user: context[:current_user],
          replied: replied
        )
      end
    end

    private

    def replied_not_found(replied_id)
      context.add_error(
        GraphQL::ExecutionError.new(
          "Post with id #{replied_id} to reply to not found",
          extensions: { code: REPLIED_NOT_FOUND_ERROR_CODE, replied_id: replied_id }
        )
      )
    end
  end
end
