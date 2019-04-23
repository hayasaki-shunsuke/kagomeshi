class Restaurant < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  validates :name, presence: true
end
