# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true

  # If a Post is deleted we want to delete all its replies and the replies of the replies
  has_many :replies, class_name: 'Post', foreign_key: 'replied_id', inverse_of: :replied, dependent: :destroy
  belongs_to :replied, class_name: 'Post', optional: true, inverse_of: :replies
end
