# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :posts, [PostType], null: false
  end
end
