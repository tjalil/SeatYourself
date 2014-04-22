class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :restaurant_owner

  validates_presence_of :name, :address, :description
  before_save :name_capitalize

  private

  def name_capitalize
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end
