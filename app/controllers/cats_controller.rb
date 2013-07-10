class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @colors = ColorValidator::COLORS
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(params[:cat])
    @colors = ColorValidator::COLORS
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @colors = ColorValidator::COLORS
    @cat = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    params[:cat].each do |key, value|
      cat[key.to_sym] = value
    end
    cat.save
    redirect_to cats_url
  end

  def destroy
    Cat.destroy(params[:id])
    redirect_to cats_url
  end
end