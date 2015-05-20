class Address < ActiveRecord::Base
  
  validates :city,    :presence => true
  validates :state,   :presence => true
  validates :zip,     :presence => true
  
  belongs_to :addressable, :polymorphic => true
    
  def to_s
    "<Address#{id} #{street1} #{city},#{state} #{zip}>"
  end
  
end
