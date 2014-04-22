class AddOpeningTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :opening_time, :time
  end
end
