class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def authenticate
    session[:token] ||= SecureRandom.urlsafe_base64(8)
    user = User.find_by_session_token(session[:token])
    if user.nil?
      redirect_to new_session_url
    else
      user.session_token = session[:token]
      user.save
      @current_user = user
    end
  end

  def logged_in?
    !!@current_user
  end
end
