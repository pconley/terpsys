class Interpreter < ActiveRecord::Base
  
  validates :user_id,     :presence => true, uniqueness: true
  validates :skill_level, :presence => true
  validates :hourly_rate, :presence => true
  
  belongs_to :user
  
  def to_s
    "<Terp#{id} #{user.name} #{skill_level}>"
  end
  
end
