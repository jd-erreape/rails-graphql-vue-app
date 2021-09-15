# frozen_string_literal: true

module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentials, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials:)
      user = User.find_by(email: credentials[:email])

      # ensure correct user
      return unless user&.authenticate(credentials[:password])

      # obtain the token for the given user
      token = token_for(user)
      # store the token in session
      context[:session][:token] = token

      # return the user and the created token
      # so the client can store it for subsequent requests
      # even though with the strategy we're using of
      # storing the current user in session this wont be necessary
      {
        user: user,
        token: token_for(user)
      }
    end

    private

    def token_for(user)
      # This way of building a token is not production ready
      # but for the purpose of the task is enough
      key = Rails.application.credentials[:secret_key_base].byteslice(0..31)
      crypt = ActiveSupport::MessageEncryptor.new(key)

      crypt.encrypt_and_sign("user-id:#{user.id}")
    end
  end
end
