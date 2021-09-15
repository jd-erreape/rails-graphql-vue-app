# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false
  end
end
