# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    argument :body, String, required: true

    type Types::PostType

    def resolve(body:)
      with_error_check do
        Post.create(
          body: body,
          user: context[:current_user]
        )
      end
    end
  end
end
