class Public::ShopsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :ranking]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  def ranking
    @all_ranks = Shop.create_all_ranks
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
                                 :telephone_number)
  end
end