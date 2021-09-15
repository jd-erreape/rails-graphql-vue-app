# frozen_string_literal: true

module Mutations
  class CreateLikeable < BaseMutation
    POST_NOT_FOUND_ERROR_CODE = 'POST_NOT_FOUND_ERROR_CODE'

    argument :post_id, Integer, required: true

    def resolve(post_id:)
      with_error_check do
        post = Post.find_by(id: post_id)

        return post_not_found(post_id) unless post

        "LikeableCreation::#{self.class::LIKEABLE}".constantize.new(
          post: post,
          user: context[:current_user]
        ).run
      end
    end

    protected

    def post_not_found(post_id)
      context.add_error(
        GraphQL::ExecutionError.new(
          "Post with id #{post_id} to #{self.class::LIKEABLE} to not found",
          extensions: { code: POST_NOT_FOUND_ERROR_CODE, post_id: post_id }
        )
      )
    end
  end
end
