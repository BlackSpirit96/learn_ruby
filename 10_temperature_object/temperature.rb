class Temperature
  
  attr_accessor :fahrenheit, :celsius
  
  def initialize(options = {})
    @fahrenheit = options[:f]
    @celsius = options[:c]
  end
  
  def ftoc(temperature)
    (temperature - 32) * 5.0 / 9.0
  end

  def ctof(temperature)
    (temperature * (9.0 / 5.0)) + 32
  end
  
  def in_fahrenheit
    return @fahrenheit if @celsius.nil?
    ctof(@celsius)
  end
  
  def in_celsius
    return @celsius if @fahrenheit.nil?
    ftoc(@fahrenheit)
  end
  
  def self.from_celsius(celsius)
#     Temperature.new(:c => celsius)
    Celsius.new(celsius)
  end
  
  def self.from_fahrenheit(fahrenheit)
#     Temperature.new(:f => fahrenheit)
    Fahrenheit.new(fahrenheit)
  end
    
end

class Celsius < Temperature
  
  def initialize(celsius)
    @celsius = celsius
  end
  
  def in_fahrenheit
    ctof(@celsius)
  end
  
  def in_celsius
    @celsius
  end
  
end

class Fahrenheit < Temperature
  
  def initialize(fahrenheit)
    @fahrenheit = fahrenheit
  end
  
  def in_fahrenheit
    @fahrenheit
  end
  
  def in_celsius
    ftoc(@fahrenheit)
  end
  
end