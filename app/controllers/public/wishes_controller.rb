class Public::WishesController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    wish = current_user.wishes.new(shop_id: shop.id)
    wish.save
    redirect_to request.referer
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    wish = current_user.wishes.find_by(shop_id: shop.id)
    wish.destroy
    redirect_to request.referer
  end
end
