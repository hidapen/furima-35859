class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:/]
  # only: [:/]を追記したことで、ログアウト後にトップページへ遷移できた。それまではログアウト後、ログインページへ遷移する状態だった。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday])
  end
end
