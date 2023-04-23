class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def ensure_guest_user
    if current_user.name == "guestuser"
      redirect_to mypage_path, notice: 'ゲストユーザーでは操作できません'
    end
  end

  def authenticate_admin_or_user!
    if admin_signed_in? || user_signed_in?
    else 
      redirect_to root_path
    end
  end
  

end
