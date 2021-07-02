class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :ranking]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shops_path, alert: '新しい和菓子屋が投稿されました!'
    else
      render :new
    end
  end

  def index
    @shops = Shop.order(created_at: :desc)
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews.order(created_at: :desc)
  end

  def edit
    @shop = Shop.find(params[:id])
    unless @shop.user == current_user
      redirect_to shop_path(@shop)
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), alert: '編集されました!'
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path, alert: '削除されました。またのご紹介お待ちしております!'
  end

  def ranking
    @ranks = Shop.week_ranks
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
