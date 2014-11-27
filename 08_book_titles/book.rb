class Book
  attr_accessor :title
  def title=(title)
    first = true
    @title = title.split.each do |word|
      if first
        first = false
        word.capitalize!
      end
      word.capitalize! if word == 'i' || (word != "and" && word != "the" && word.length > 2)
    end
    .join(" ")
  end
  
end