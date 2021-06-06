class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  attachment :shop_image


  validates :name, :kana_name, :postal_code, :address, presence: true
  validates :kana_name, format: { with: /\p{hiragana}/ }
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :description, length: { maximum: 200 }
  validates :bussiness_start_time, presence: true
  validates :bussiness_end_time, presence: true
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
end
