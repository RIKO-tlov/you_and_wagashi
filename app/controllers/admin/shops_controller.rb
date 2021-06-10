class Admin::ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end
end
