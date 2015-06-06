module UsersHelper
  
  def format_as_dollars(rate)
    rate ? number_to_currency(rate/100.0) : '0.00'
  end
  
end
