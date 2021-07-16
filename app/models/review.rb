class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :genre
  attachment :product_image

  # 星評価を1~5段階で設定
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

  validates :comment, length: { maximum: 200 }
  validates :product_name, :comment, presence: true
  
  # 感情分析スコア
  def self.aggregateScore(array)
    require 'bigdecimal'
    result = [["ポジティブ",0],["ニュートラル",0],["ネガティブ",0]]
    array.each do |i|
      if BigDecimal(i.to_s.to_d).floor(1).to_f >= 0.3
        result[0][1] += 1
      elsif BigDecimal(i.to_s.to_d).floor(1).to_f >= -0.3
        result[1][1] += 1
      else
        result[2][1] += 1
      end
    end
    return result
  end

end
