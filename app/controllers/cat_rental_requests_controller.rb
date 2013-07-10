class CatRentalRequestsController < ApplicationController
  def index
    @crrs = CatRentalRequest.find_all_by_cat_id(params[:cat_id])
  end

  def show
    @crr = CatRentalRequest.find(params[:id])
    @cat = Cat.find(@crr.cat.id)
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
    if @crr.cat.user_id != @current_user.id
      redirect_to cat_url(crr.cat_id)
    end
  end

  def update
    crr = CatRentalRequest.find(params[:id])

    if crr.cat.user_id != @current_user.id
      redirect_to cat_url(crr.cat_id)
    else
      params[:cat_rental_request].each do |key, value|
        if key == "status"
          if value == "Approve"
            crr[key.to_sym] = "approved"
          elsif value == "Deny"
            crr[key.to_sym] = "denied"
          end
        else
          crr[key.to_sym] = value
        end
      end
      crr.save
      redirect_to cat_cat_rental_requests_url(crr.cat_id)
    end
  end

  def destroy
    cat_id = CatRentalRequest.find(params[:id]).cat_id
    CatRentalRequest.destroy(params[:id])
    redirect_to cat_cat_rental_requests_url(cat_id)
  end
end