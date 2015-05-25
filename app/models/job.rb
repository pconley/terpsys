class Job < ActiveRecord::Base
    
  validates :status,       :presence => true
  validates :consumer_id,  :presence => true
  validates :customer_id,  :presence => true
  validates :description,  :presence => true
  validates :starts_on,    :presence => true
  validates :starts_at,    :presence => true
  validates :duration,     :presence => true, numericality: { only_integer: true }  
  validates :requested_at, :presence => true
  
  belongs_to :consumer
  belongs_to :customer
  belongs_to :interpreter
  
  attr_accessor :duration_string
  
  # before_save :default_values
  # def default_values
  #   self.status       ||= 'Active'
  #   self.duration     ||= 60 # minutes
  #   self.requested_at ||= Time.zone.now
  # end
  
  def when
    "#{starts_on.strftime('%Y-%m-%d')} @ #{starts_at.strftime('%H:%M')} for #{duration} mins"
  end
  
  def to_s
    "<Job#{id} #{description[0..20]}>"
  end
  
end
