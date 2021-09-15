# frozen_string_literal: true

FactoryBot.define do
  factory :dislike do
    user
    post
  end
end
