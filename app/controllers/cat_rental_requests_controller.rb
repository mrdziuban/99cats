class CatRentalRequestsController < ApplicationController
  def index
    @crrs = CatRentalRequest.find_all_by_cat_id(params[:cat_id])
  end

  def show
    @cat = Cat.find_by_id(params[:cat_id])
    @crr = CatRentalRequest.find(params[:id])
  end

  def new
    @cat = Cat.find(params[:cat_id])
  end

  def create
    crr = CatRentalRequest.create(params[:cat_rental_request])
    if crr.errors.messages.empty? # no problems
      redirect_to cat_cat_rental_requests_url(params[:cat_rental_request][:cat_id])
    else # error with submission
      @error = crr.errors.messages[:begin_date]
      redirect_to new_cat_cat_rental_request_url(cat_id: params[:cat_rental_request][:cat_id],
                                                  error: @error)
    end
  end

  def edit
    @cat = Cat.find(params[:cat_id])
    @crr = CatRentalRequest.find(params[:id])
  end

  def update
    crr = CatRentalRequest.find(params[:id])
    params[:cat_rental_request].each do |key, value|
      crr[key.to_sym] = value
    end
    crr.save
    redirect_to cat_cat_rental_requests_url
  end
end