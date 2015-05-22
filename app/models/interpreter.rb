class Interpreter < ActiveRecord::Base
  
  validates :user_id,     :presence => true, uniqueness: true
  validates :default_payrate, numericality: { only_integer: true }
    
  belongs_to :user
  
  delegate :email, to: :user
  
  def to_s
    "<Terp#{id} #{user.email} #{default_payrate}>"
  end
  
end
