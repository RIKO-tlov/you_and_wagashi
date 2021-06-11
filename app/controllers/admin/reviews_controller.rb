class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def destroy
    Review.find_by(id: params[:id], shop_id:params[:shop_id]).destroy
    redirect_to root_path
  end
end
