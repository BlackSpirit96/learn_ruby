def reverser
  text = yield.reverse
  text.split.reverse.join(" ")
end

def adder(number = 1)
  yield + number
end

def repeater(repeat = 1)
  repeat.times { yield }
end