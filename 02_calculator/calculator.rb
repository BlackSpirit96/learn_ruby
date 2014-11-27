def add(a,b)
  a + b
end

def subtract(a,b)
  a - b
end

def sum(array)
  if array.length == 0 then
    0
  else
    sum = 0
    array.each do |number|
      sum += number
    end
    sum
  end
end
  
def multiply(array)
  if array.length == 0 then
    0
  else
    value = 1
    array.each do |number|
      value *= number
    end
    value
  end
end
    
def power(a,b)
  a ** b
end
  
def factorial(number)
  if number == 0 then
    1
  else
    number * factorial(number - 1)
  end
end