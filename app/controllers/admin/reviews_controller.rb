class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.order(created_at: :desc)
    #チャート用
    @review = @shop.reviews.pluck(:score)
    @aggregate = aggregateScore(@review)
  end

  def aggregateScore(array)
    score = @reviews
    result = [["ポジティブ",0],["ニュートラル",0],["ネガティブ",0]]
      if score == (0.3..1.0)
        result[0]
      elsif score == (-0.3..0.3)
        result[1]
      else
        result[2]
      end
    return result
  end
  #ここまで


  def destroy
    review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    review.destroy
    redirect_to request.referrer, notice: 'レビューを１件削除しました'
  end

end
