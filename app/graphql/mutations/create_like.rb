# frozen_string_literal: true

module Mutations
  class CreateLike < CreateLikeable
    LIKEABLE = 'Like'

    type Types::LikeType
  end
end
