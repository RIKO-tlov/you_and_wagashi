class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.order(created_at: :desc)
    #グラフ
    @score = @shop.reviews.pluck(:score)
    @aggregate = aggregateScore(@score)
  end

  def aggregateScore(array)
    require 'bigdecimal'
    result = [["ポジティブ",0],["ニュートラル",0],["ネガティブ",0]]
    array.each do |i|
      if BigDecimal(i.to_s).floor(1).to_f >= 0.3
        result[0][1] +=1
      elsif BigDecimal(i.to_s).floor(1).to_f >= -0.3
        result[1][1] +=1
      else
        result[2][1] +=1
      end
    end
    return result
  end

  def destroy
    review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    review.destroy
    redirect_to request.referrer, notice: 'レビューを１件削除しました'
  end

end
