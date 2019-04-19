class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
end
