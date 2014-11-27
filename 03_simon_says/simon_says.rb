def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, repeat = 2)
  return "#{text}" if repeat == 1
  "#{text} #{repeat(text, repeat-1)}" if repeat != 0
end

def start_of_word(text, letters = 1)
  text[0...letters]
end

def first_word(text)
  text.split[0]
end

def titleize(text)
  text = text.split
  text.each do |word|
    if word != "the" && word != "and" && word != "over"
      word.capitalize!
    end
  end
  text[0].capitalize!
  text.join(" ")
end