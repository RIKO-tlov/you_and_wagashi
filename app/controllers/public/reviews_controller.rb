class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.new(review_params)
    @review.shop_id = @shop.id
    if @review.save
      redirect_to shop_path(@shop), alert: 'レビューを投稿しました!'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @shop = Shop.find(params[:shop_id])
    unless @review.user == current_user
      redirect_to shop_path(params[:shop_id])
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to shop_path(params[:shop_id]), alert: 'レビューを編集しました!'
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
    @review.destroy
    @reviews = @shop.reviews

  end

  private
    def review_params
      params.require(:review).permit(:shop_id,
                                     :user_id,
                                     :comment,
                                     :rate,
                                     :product_name,
                                     :product_image,
                                     :genre_id)
    end

end
