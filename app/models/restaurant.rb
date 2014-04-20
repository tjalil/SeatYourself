class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, through :reservations
  belongs_to :restaurant_owner
  
end
