class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :restaurant_owner

  validates_presence_of :name, :address, :description, :opening_time, :closing_time
  before_save :name_capitalize

  # def availability(party_size, party_time)
  #   reserve_size = reservations.where(party_time: party_time).sum(:party_size)
  #   reserve_size + party_size <= capacity
  #   #in this method we need to add all the party sizes and check if the sum is less than the capacity
  # end


  def time_slots

    reservation_interval = 1

    if (Time.zone.now + 15.minutes) > (Time.zone.now + 1.hours).at_beginning_of_hour
      first_time_slot = [(Time.zone.now.hour + 2), self.opening_time.hour].max
    else
      first_time_slot = [(Time.zone.now.hour + 1), self.opening_time.hour].max
    end
    
    last_time_slot = self.closing_time.hour
    #last_time_slot = Time.zone.now + 10.hours

    available_time_slots = []
    reservation_time = first_time_slot

    while reservation_time < last_time_slot do
      available_time_slots << reservation_time
      reservation_time += reservation_interval

      # if (reservation_time + reservation_interval) > @restaurant.closing_time
      #   reservation_time = @restaurant.opening_time + 1.day
      # end

    end

    available_time_slots.map! do |hour|
      new_time = Time.zone.local(Time.now.year, Time.now.month, Time.now.day, hour)
      new_time.strftime('%A %e, %B at %l:%M %P')
    end

    available_time_slots
  end


  private

  def name_capitalize
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end
