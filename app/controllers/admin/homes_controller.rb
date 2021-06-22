class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @shops = Shop.all
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path, notice: '削除されました'
  end
end
