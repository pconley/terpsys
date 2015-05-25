class Consumer < ActiveRecord::Base
  
  validates :last_name,  :presence => true
  validates :first_name, :presence => true
  validates_inclusion_of :gender, :in => %w( m f )
  
  belongs_to :user
  accepts_nested_attributes_for :user
  attr_accessor :username, :email, :password
  validates :user, :presence => true, uniqueness: true
  
  delegate :email,    to: :user
  delegate :roles,    to: :user
  delegate :username, to: :user
  
  has_one  :address, :as => :addressable
  has_many :phones,  :as => :phoneable
  has_many :jobs
  
  def to_s
    "<Consumer#{id} #{fullname} #{gender}>"
  end
  
  def fullname
    "#{last_name}, #{first_name}"
  end
  
end
