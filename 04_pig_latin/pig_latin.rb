def word_letter(text, letter = 1)
  text[letter - 1...letter]
end

def is_upper?(letter)
  letter == letter.upcase
end

def prepare_consonants(text)
  consonants = ""
  prev_letter = ""
  text.length.times do |i|
    letter = text[i]
    is_upper = is_upper?(letter)
    letter.downcase
    consonants += letter if letter == "u" && prev_letter == "q"
    break if letter == 'a' || letter == 'e' || letter == 'o' || letter == 'u' || letter == 'i'
    if letter != 'a' && letter != 'e' && letter != 'o' && letter != 'u' && letter != 'i'
      letter.upcase! if is_upper
      consonants += letter
      prev_letter = letter.downcase
    end
  end
  consonants
end

def convert(text)
  consonants = prepare_consonants(text)
  last_consonant = consonants.length
  "#{text[last_consonant..-1] + consonants}ay"
end

def translate(text)
  text = text.split
  new_text = []
  text.each do |word|
    new_text << convert(word)
  end
  new_text.join(" ")
end