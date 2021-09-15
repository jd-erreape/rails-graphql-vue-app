# frozen_string_literal: true

module LikeableCreation
  class Base
    def initialize(user:, post:)
      @user = user
      @post = post
    end

    def run
      to_remove&.destroy

      self.class::TO_ADD.create(user: user, post: post)
    end

    private

    attr_reader :user, :post

    def to_remove
      @to_remove ||= self.class::TO_REMOVE.find_by(user: user, post: post)
    end
  end
end
