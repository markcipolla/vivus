require 'rdiscount'

class Example
  def initialize (match)
    @block = match[2]
  end

  def partial
    "example"
  end

  def render
   strip_block_marker(@block)
  end

  def code
    match[2]
  end

  private

  def strip_block_marker(block)
    block.gsub(/\n\s*\*\s*/m, "\n").strip
  end
end
