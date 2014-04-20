class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :restaurant_owner

  validates_presence_of :name, :address, :description
  before_save :text_capitalize

  private

  def text_capitalize
    self.name = self.name.capitalize
    self.description = self.description.capitalize
  end
  
end
