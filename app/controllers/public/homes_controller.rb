class Public::HomesController < ApplicationController

  def top
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'guest'
      user.birthdate = '19970101'
      user.age = '24'
      user.sex = '女性'
      user.password = SecureRandom.urlsafe_base64
    end

    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
