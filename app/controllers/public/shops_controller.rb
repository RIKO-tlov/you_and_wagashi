class Public::ShopsController < ApplicationController

  def new
    @shop = Shop.new
  end

  def create
	  @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
    redirect_to shops_path
  end

	def index
	  @shops = Shop.all
	end

	def show
		@shop = Shop.find(params[:id])
	end

	def edit
	end

	private

	def shop_params
	  params.require(:shop).permit(:kana_name,
	                               :name,
	                               :shop_image,
	                               :postal_code,
	                               :address,
	                               :description,
	                               :url,
	                               :holiday,
	                               :bussiness_start_time,
	                               :bussiness_end_time,
	                               :telephone_number
	                               )
	end
end
