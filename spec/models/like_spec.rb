# frozen_string_literal: true

require 'rails_helper'
require_relative './shared/likeable'

RSpec.describe Like, type: :model do
  it_behaves_like 'a Likeable model', :like
end
