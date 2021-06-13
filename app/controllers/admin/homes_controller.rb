class Admin::HomesController < ApplicationController

  def top
    @shops = Shop.all
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to request.referer
  end
end
