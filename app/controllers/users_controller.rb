class UsersController < ApplicationController

  before_filter :authenticate, except: [:new, :create]

  def create
    user = User.create(params[:user], session_token: SecureRandom.urlsafe_base64(8))
    redirect_to cats_url
  end
end