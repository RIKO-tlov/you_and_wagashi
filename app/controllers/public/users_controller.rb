class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '編集されました!'
    else
      render :edit
    end
  end

  def reviews
    @shops = current_user.reviewed_shops.distinct #重複したレコードを削除
  end

  private

  def user_params
    params.require(:user).permit(:profile_image,
                                 :name,
                                 :email,
                                 :age,
                                 :birthdate)
  end

end
