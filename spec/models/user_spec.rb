# frozen_string_literal: true

require 'rails_helper'
require_relative '../constants/emails'

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_values(*VALID_EMAILS).for(:email) }
  it { is_expected.not_to allow_values(*INVALID_EMAILS).for(:email) }
  it { is_expected.to have_many(:posts).dependent(:destroy) }
end
