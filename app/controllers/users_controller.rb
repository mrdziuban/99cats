class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(params[:user], session_token: SecureRandom.urlsafe_base64(8))
    redirect_to cats_url
  end
end