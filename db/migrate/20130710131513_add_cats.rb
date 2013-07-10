class AddCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color
      t.string :name
      t.string :sex
    end
  end
end
