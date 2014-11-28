class RPNCalculator
  attr_reader :value
  def initialize
    @stack = []
    @value = 0
  end
  
  def push(number)
    @stack.push number
  end
  
  def check_stack?
    @stack.size >= 2
  end
  
  def calculate(operator)
    if check_stack?
      first = @stack.pop.to_f
      second = @stack.pop.to_f
      @value = second.send(operator, first)
      push(@value)
    else
      raise "calculator is empty"
    end
  end
  
  def plus
    calculate("+")
  end
  
  def minus
     calculate("-")
  end
  
  def divide
     calculate("/")
  end
  
  def times
     calculate("*")
  end
  
  def tokens(string)
    array = []
    string.split.each do |value|
      if value == "+" || value == "-" || value == "*" || value == "/"
        array << value.to_sym
      else
        array << value.to_i
      end
    end
    array
  end
  
  def evaluate(string)
    tokens(string).each do |value|
      if value.is_a?(Integer)
        push(value)
      else
        calculate(value.to_s)
      end
    end
    @value
  end
  
end