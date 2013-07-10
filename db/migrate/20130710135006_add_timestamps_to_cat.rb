class AddTimestampsToCat < ActiveRecord::Migration
  def change
    add_column :cats, :created_at, :datetime
    add_column :cats, :modified_at, :datetime
  end
end
