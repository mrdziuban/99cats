class AddStatusToCatRentalRequests < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :status, :string, default: "undecided"
  end
end
