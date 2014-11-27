class Dictionary
  attr_accessor :entries
  def initialize
    @entries = {}
  end
  
  def add(options)
    if options.is_a?(String)
      @entries.merge!({options => nil})
    else
      @entries.merge!(options)
    end
  end
  
  def keywords
    @entries.keys.sort
  end
  
  def include?(key_name)
    keys = self.keywords
    keys.each do |key|
      return true if key == key_name
    end
    false
  end
  
  def find(key_part)
    results = {}
    keys = self.keywords
    keys.each do |key|
      results.merge!({key => @entries[key]}) if key.include? key_part
    end
    results.sort.to_h
  end
  
  def printable
    result = ""
    @entries.sort.to_h.each do |keyword, definition|
      result += "[#{keyword}] \"#{definition}\"\n"
    end
    result[0..-2]
  end
end