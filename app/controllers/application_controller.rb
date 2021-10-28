class ApplicationController < ActionController::Base
  def require_user
    redirect_to sign_up_path unless session[:user_id]
  end
end
