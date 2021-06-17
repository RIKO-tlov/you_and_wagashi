class Review < ApplicationRecord

  belongs_to :user
  belongs_to :shop
  attachment :product_image

  #星評価を1~5段階で設定
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  validates :comment, length: { maximum: 200 }
  validates :product_name, :comment, presence: true
end
