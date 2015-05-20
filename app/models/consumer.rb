class Consumer < ActiveRecord::Base
  
  validates :user_id,     :presence => true, uniqueness: true
  validates :last_name,   :presence => true
  validates :first_name,  :presence => true
  validates_inclusion_of :gender, :in => %w( m f )
  
  belongs_to :user
  
  delegate :roles, to: :user
  
  has_one  :address, :as => :addressable
  has_many :phones,  :as => :phoneable
  
  def to_s
    "<Consumer#{id} #{fullname} #{gender}>"
  end
  
  def fullname
    "#{last_name}, #{first_name}"
  end
  
end
