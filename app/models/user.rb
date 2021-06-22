class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewed_shops, through: :reviews, source: :shop
  has_many :visits, dependent: :destroy
  has_many :visited_shops, through: :visits, source: :shop
  has_many :wishes, dependent: :destroy
  has_many :wished_shops, through: :wishes, source: :shop
  attachment :profile_image

  validates :name, :email, :age, :birthdate, :sex, presence: true
  validates :name, :email, uniqueness: true

  # enum sex: { 女性: 0, 男性: 1 }

end
