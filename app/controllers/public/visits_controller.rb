class Public::VisitsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    visit = current_user.visits.new(shop_id: shop.id)
    visit.save
    redirect_to request.referer
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    visit = current_user.visits.find_by(shop_id: shop.id)
    visit.destroy
    redirect_to request.referer
  end
end
