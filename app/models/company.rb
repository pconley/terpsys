class Company < ActiveRecord::Base
  
  validates :name,          :presence => true, uniqueness: true
  validates :contact_email, :presence => true, uniqueness: true
  
  def to_s
    "<Company#{id} #{name} #{contact_email}>"
  end
    
end
