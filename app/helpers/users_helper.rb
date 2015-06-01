module UsersHelper
  
  def format_as_dollars(rate)
    number_to_currency(rate/100.0)
  end
  
end
