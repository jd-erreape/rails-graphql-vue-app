# frozen_string_literal: true

module Types
  class DislikeType < Types::BaseObject
    field :user, UserType, null: false
    field :post, PostType, null: false
  end
end
