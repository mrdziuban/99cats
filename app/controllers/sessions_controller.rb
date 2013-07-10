class SessionsController < ApplicationController

  before_filter :authenticate, except: [:new, :create]

  def create
    user = User.find_by_username(params[:session][:username])
    if user.password == params[:session][:password]
      user.session_token = SecureRandom.urlsafe_base64(8)
      user.save
      session[:token] = user.session_token
      redirect_to cats_url
    else
      redirect_to new_session_url(error: "Incorrect password")
    end
  end
end