class CatRentalRequestsController < ApplicationController
  def index
    @crrs = CatRentalRequest.find_all_by_cat_id(params[:cat_id])
  end
end