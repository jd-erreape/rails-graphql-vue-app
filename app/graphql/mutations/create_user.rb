# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentials, required: true

    type Types::UserType

    def resolve(credentials:)
      user = User.create(
        email: credentials[:email],
        password: credentials[:password]
      )

      return user if user.valid?

      # We need the return or the type
      # errors will be rescued and we'll
      # see a GraphQL error
      build_errors(user) and return
    end
  end
end
