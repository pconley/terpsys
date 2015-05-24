class Interpreter < ActiveRecord::Base
  
  validates :last_name,   :presence => true
  validates :first_name,  :presence => true
  validates :default_payrate, numericality: { only_integer: true }
    
  belongs_to :user
  # delegate :email, to: :user
  # delegate :username, to: :user
  accepts_nested_attributes_for :user
  attr_accessor :username, :email, :password
  validates :user, :presence => true, uniqueness: true
  # validates_associated :user # upon creation
    
  def to_s
    "<Terp#{id} #{user.email} #{default_payrate}>"
  end
  
end
