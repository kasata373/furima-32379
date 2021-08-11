class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.all
  end

  def create
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :surname, :name, :surname_kana, :name_kana, :birthday])
  end
end
