# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    body { Faker::Lorem.sentence }
  end
end
