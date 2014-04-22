class ChangeDateFormatInReservations < ActiveRecord::Migration
  def change
    change_column :reservations, :reservation_time, :time
  end
end
