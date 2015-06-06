class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
  #      :confirmable, :lockable, :timeoutable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, :presence => true, uniqueness: true
  validates :email,    :presence => true, uniqueness: true
  validates :password, :presence => true, :on => :create
  
  validates :default_payrate, numericality: { only_integer: true, greater_than_or_equal_to: 30 }, if: :interpreter?
    
  belongs_to :agency 
  belongs_to :customer # if a requester 
  has_one    :address, :as => :addressable
  has_many   :phones,  :as => :phoneable
  
  has_many :consumer_jobs, foreign_key: "consumer_id", class_name: "Job"
  has_many :interpreter_jobs, foreign_key: "interpreter_id", class_name: "Job"
  
  scope :with_role, ->(role) { where("roles_mask & #{2**ROLES.index(role)} > 0") }
  
  ROLES = %i[admin consumer interpreter requester]
  
  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def has_role?(role)
    roles.include?(role)
  end
  
  def interpreter?
    has_role? :interpreter
  end
  def requester?
    has_role? :requester
  end
  def consumer?
    has_role? :consumer
  end
  def admin?
    has_role? :admin
  end
    
  def roles_to_s
    roles.map(&:capitalize).join(", ")
  end
  
  def fullname
    name = ''
    name += "#{prefix} "       if prefix
    name += "#{first_name} "   if first_name
    name += "#{middle_name} "  if middle_name && middle_name.length > 1
    name += "#{middle_name}. " if middle_name && middle_name.length == 1
    name += "#{last_name}"     if last_name
    name += " #{suffix}"       if suffix
    
    name = email if name.strip.length == 0
    
    return name
  end

  def to_s
    "<User#{id} #{email}>"
  end
  
end
