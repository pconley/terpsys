module Trace

  def trace(s)
    puts s.blue unless Rails.env.test? 
  end
  
  def error(s)
    # quiet the intentional errors in test!
    force(s) unless Rails.env.test?
  end
  
  def force(s)
    # puts this message even in test environment
    puts "ERROR: #{s}".red
  end

end