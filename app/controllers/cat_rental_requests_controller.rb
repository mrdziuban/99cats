class CatRentalRequestsController < ApplicationController
  def index
    @crrs = CatRentalRequest.find_all_by_cat_id(params[:cat_id])
  end

  def show
    @cat = Cat.find_by_id(params[:cat_id])
    @crr = CatRentalRequest.find(params[:id])
  end
end