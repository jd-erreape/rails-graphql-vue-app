# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false
    field :replies, [PostType], null: true
    field :replied, PostType, null: true
    field :likes, [LikeType], null: true
    field :dislikes, [DislikeType], null: true
  end
end
