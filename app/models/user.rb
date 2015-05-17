class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
  #      :confirmable, :lockable, :timeoutable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name,     :presence => true, uniqueness: true
  validates :email,    :presence => true, uniqueness: true
  validates :password, :presence => true
  
  #attr_accessible :roles

  # belongs_to :device
  # has_one :resolution
  
  ROLES = %i[admin consumer employee interpreter]
  
  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def to_s
    "<User#{id} #{name} #{email}>"
  end
  
end
