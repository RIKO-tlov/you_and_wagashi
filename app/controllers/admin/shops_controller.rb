class Admin::ShopsController < ApplicationController

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to request.referer
  end
end
