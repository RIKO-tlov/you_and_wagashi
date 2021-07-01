class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.order(created_at: :desc)
  end

  def destroy
    review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    review.destroy
    redirect_to request.referrer, notice: 'レビューを１件削除しました'
  end
end
