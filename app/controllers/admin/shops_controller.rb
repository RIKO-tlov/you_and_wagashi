class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to request.referer, notice: '和菓子店を１件削除しました'
  end

end
