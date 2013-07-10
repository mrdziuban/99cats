class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end

    add_index :cat_rental_requests, :cat_id
  end
end
