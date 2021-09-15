# frozen_string_literal: true

module LikeableCreation
  class Dislike < Base
    TO_REMOVE = ::Like
    TO_ADD = ::Dislike
  end
end
