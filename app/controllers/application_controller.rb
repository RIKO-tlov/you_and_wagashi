class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q

  protected

  def configure_permitted_parameters
    # デフォルトのauthentication_keysを:nameに変更したため、keysに:emailを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :age,
      :sex,
      :birthdate,
    ])
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
