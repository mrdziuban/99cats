class FixTimestampsForCat < ActiveRecord::Migration
  def change
    rename_column :cats, :modified_at, :updated_at
  end
end
