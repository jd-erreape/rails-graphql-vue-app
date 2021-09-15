# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
end
