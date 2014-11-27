class Timer
  
  attr_accessor :seconds
  
  def initialize
    @seconds = 0
    @minutes = 0
    @houts = 0
  end
  
  def padded(number)
    return "0#{number}" if number.to_s.length == 1
    number.to_s
  end
  
  def time_string
    
    # calculate time
    
    @minutes = @seconds / 60
    @seconds -= @minutes * 60
    @hours = @minutes / 60
    @minutes -= @hours * 60
    
    # format time
    @hours = self.padded(@hours)
    @minutes = self.padded(@minutes)
    @seconds = self.padded(@seconds)
    
    # display time
    
    "#{@hours}:#{@minutes}:#{@seconds}"
  end
  
end