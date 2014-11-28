class XmlDocument
  
  def initialize(indent=false)
    @indent = indent
    @indent_spaces = 0
  end
  
  def apply_indent(open=false,space_num = @indent_spaces)
    spaces = ""
    if @indent
      space_num.times { spaces += " "}
      @indent_spaces += 2 if open
    end
    spaces
  end
  
  def apply_line
    "\n" if @indent
  end
  
  def prepare_tags(tags_hash)
    tags = ""
    tags_hash.each do |key, value|
      tags += "#{key}='#{value}' "
    end
    tags[0..-2]
  end
  
  def self_closing(name, tags_hash)
    return "#{apply_indent}<#{name}/>" if tags_hash.length == 0
    "#{apply_indent}<#{name} #{prepare_tags(tags_hash)}/>#{apply_line}"
  end
  
  def open(name, tags_hash)
    return "#{apply_indent(true)}<#{name}>#{apply_line}" if tags_hash.length == 0
    "#{apply_indent(true)}<#{name} #{prepare_tags(tags_hash)}>#{apply_line}"
  end

  def close(name)
    @indent_spaces -= 2
    "#{apply_indent}</#{name}>#{apply_line}"
  end

  def hello(tags_hash={})
    if block_given?
      "#{open("hello",tags_hash)}#{yield}#{close("hello")}"
    else
      self_closing("hello", tags_hash)
    end
  end

  def goodbye(tags_hash={})
    if block_given?
      "#{open("goodbye",tags_hash)}#{yield}#{close("goodbye")}"
    else
      self_closing("goodbye", tags_hash)
    end
  end

  def come_back(tags_hash={})
    if block_given?
      "#{open("come_back",tags_hash)}#{yield}#{close("come_back")}"
    else
      self_closing("come_back", tags_hash)
    end
  end

  def ok_fine(tags_hash={})
    if block_given?
      "#{open("ok_fine",tags_hash)}#{yield}#{close("ok_fine")}"
    else
      self_closing("ok_fine", tags_hash)
    end
  end

  
  def send(tag_name)
    "<#{tag_name}/>"
  end
end