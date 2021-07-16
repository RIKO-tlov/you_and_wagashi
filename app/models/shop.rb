class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :wishes, dependent: :destroy
  attachment :shop_image

  validates :name, :kana_name, :postal_code, :address, presence: true
  validates :kana_name, format: { with: /\p{hiragana}/ }
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :description, length: { maximum: 200 }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }

  geocoded_by :address
  after_validation :geocode

  # 行ったボタンを押したかどうか
  def visited_by?(user)
    visits.where(user_id: user.id).exists?
  end

  # 行きたいボタンを押したかどうか
  def wished_by?(user)
    wishes.where(user_id: user.id).exists?
  end

  # 行きたい順週間ランキング
  def self.week_ranks
    Shop.joins(:wishes).where(wishes: { created_at: Date.today.beginning_of_week..Date.today.end_of_week }).group(:id).order("count(shops.id) desc").limit(3)
  end

  # 行きたいランキング（全体）
  def self.all_ranks
    @all_ranks = Shop.find(Wish.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
  end

end
