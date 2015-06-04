class Job < ActiveRecord::Base
    
  validates :status,       :presence => true
  validates :agency_id,    :presence => true
  validates :consumer_id,  :presence => true
  validates :customer_id,  :presence => true
  validates :description,  :presence => true
  validates :starts_at,    :presence => true
  validates :duration,     :presence => true, numericality: { only_integer: true }  
  validates :requested_at, :presence => true
  
  belongs_to :agency
  belongs_to :customer  
  belongs_to :created,     :class_name => "User", :foreign_key => "created_id"
  belongs_to :updated,     :class_name => "User", :foreign_key => "updated_id"
  belongs_to :consumer,    :class_name => "User", :foreign_key => "consumer_id"
  belongs_to :interpreter, :class_name => "User", :foreign_key => "interpreter_id"
  
  attr_accessor :duration_string
  
  extend SimpleCalendar
  
  has_calendar
  
  def state
    return :past if starts_at < Time.zone.now
    return :open unless interpreter
    :pending
  end
    
  def when
    "#{starts_at.strftime('%-m/%-d')} @ #{start_time.strftime('%l:%M %P')} for #{duration} mins"
  end
  
  def to_s
    "<Job#{id} #{description[0..20]}>"
  end
  
end
