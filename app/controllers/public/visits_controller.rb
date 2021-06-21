class Public::VisitsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    visit = current_user.visits.new(shop_id: @shop.id)
    visit.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    visit = current_user.visits.find_by(shop_id: @shop.id)
    visit.destroy
  end
end
