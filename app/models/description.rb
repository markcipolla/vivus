require 'rdiscount'

class Description
  def initialize (block)
    @block = block[2]
  end

  def partial
    "description"
  end

  def render
    RDiscount.new(strip_block_marker(@block), :smart, :filter_html).to_html.html_safe
  end

  private

  def strip_block_marker(block)
    block.gsub("\n * ", "\n").gsub("\n *", "\n").strip
  end
end
