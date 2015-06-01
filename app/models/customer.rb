class Customer < ActiveRecord::Base
    
  validates :company_name,    :presence => true, uniqueness: true
  validates :requester_name,  :presence => true
  validates :requester_email, :presence => true
  validates :billing_email,   :presence => true
  # billing rate is stored in integer cents (not dollars)  
  validates :billing_rate, numericality: { only_integer: true }
  
  has_one  :address, :as => :addressable
  has_many :phones,  :as => :phoneable
  has_many :jobs
  
  belongs_to :agency
    
  def to_s
    "<Customer#{id} #{company_name}>"
  end
    
end
