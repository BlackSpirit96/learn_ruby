class Array
  
  def sum
    total = 0
    self.each do |value|
      total += value
    end
    total
  end
  
  def square
    new_array = []
    self.each do |value|
      new_array << value ** 2
    end
    new_array
  end
    
  def square!
      self.map! do |value|
        value ** 2
      end
  end
end