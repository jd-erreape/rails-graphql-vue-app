# frozen_string_literal: true

module Mutations
  class SignOutUser < BaseMutation
    null true

    def resolve
      # remove the token from session
      context[:session] && context[:session][:token] = nil

      # We are not returning anything as
      # part of this mutation, just deleting
      # the session token
    end
  end
end
