# frozen_string_literal: true

module Types
  class AuthProviderCredentials < BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
