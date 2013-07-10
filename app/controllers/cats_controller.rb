class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @colors = ColorValidator::COLORS
  end

  def create
    Cat.create(params[:cat])
    redirect_to cats_url
  end

  def edit
  end
end