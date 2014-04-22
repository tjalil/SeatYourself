class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :party_size, numericality: { greater_than: 0 }
  
end
