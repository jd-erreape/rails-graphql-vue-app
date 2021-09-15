# frozen_string_literal: true

module Mutations
  class CreateDislike < CreateLikeable
    LIKEABLE = 'Dislike'

    type Types::DislikeType
  end
end
