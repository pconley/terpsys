class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
  #      :confirmable, :lockable, :timeoutable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name,     :presence => true, uniqueness: true
  validates :email,    :presence => true, uniqueness: true
  validates :password, :presence => true

  # belongs_to :device
  # has_one :resolution
  
  def to_s
    "<User#{id} #{name} #{email}>"
  end
  
end
