# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentials, required: true

    type Types::UserType

    def resolve(credentials:)
      with_error_check do
        User.create(
          email: credentials[:email],
          password: credentials[:password]
        )
      end
    end
  end
end
