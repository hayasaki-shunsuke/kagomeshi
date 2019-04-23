class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments

  validates :nickname,
    presence: true,
    uniqueness: true,
    length: { maximum: 32 },
    format: {
      with: /\A[a-z0-9_]+\z/i,
      message: "は半角英数・アンダースコアのみで入力してください"
    }

  def to_param
    nickname
  end
end
