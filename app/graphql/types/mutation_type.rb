# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :sign_out_user, mutation: Mutations::SignOutUser
    field :create_post, mutation: Mutations::CreatePost
    field :create_reply, mutation: Mutations::CreateReply
    field :create_like, mutation: Mutations::CreateLike
    field :create_dislike, mutation: Mutations::CreateDislike
  end
end
