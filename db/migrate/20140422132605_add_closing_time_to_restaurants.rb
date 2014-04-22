class AddClosingTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :closing_time, :time
  end
end
