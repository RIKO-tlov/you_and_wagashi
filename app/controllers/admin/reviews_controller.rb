class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def destroy
    review = Review.find_by(id: params[:id], shop_id: params[:shop_id])
    review.destroy
    redirect_to request.referrer
  end
end
