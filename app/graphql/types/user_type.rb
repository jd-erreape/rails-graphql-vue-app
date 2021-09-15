# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :posts, [PostType], null: false
    field :likes, [LikeType], null: true
    field :dislikes, [DislikeType], null: true
  end
end
