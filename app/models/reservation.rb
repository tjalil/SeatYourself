class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :party_size, numericality: { greater_than: 2, less_than: 20 }

  # validate :availability

  # private

  # def availability
  #   if !restaurant.availability(party_size, party_time)
  #     errors.add(:base, "restaurant is full, go away!")
  #   end
  # end
  
end
