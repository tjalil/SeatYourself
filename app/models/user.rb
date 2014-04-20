class User < ActiveRecord::Base

  has_many :reservations
  has_many :restaurants, through: :reservations
  
  has_secure_password
  validates_presence_of :first_name, :last_name, :email
  validates :password, length: {minimum: 6}

  before_save :name_capitalize

  private

  def name_capitalize
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
  
end
