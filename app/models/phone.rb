class Phone < ActiveRecord::Base
  
  validates :number, :presence => true
  
  belongs_to :phoneable, :polymorphic => true
    
  def to_s
    "<Phone #{phone_type}: #{number} >"
  end
  
end