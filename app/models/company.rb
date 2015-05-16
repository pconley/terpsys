class Company < ActiveRecord::Base
  
  validates :name,          :presence => true
  validates :contact_email, :presence => true
  
  def to_s
    "<Company#{id} #{name}>"
  end
  
end
