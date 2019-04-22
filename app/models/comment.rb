class Comment < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :restaurant

  validates :body, presence: true
end
