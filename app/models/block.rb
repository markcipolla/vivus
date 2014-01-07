require 'rdiscount'

class Block
  def initialize (source, comment, html)
    @source = source
    @comment = comment
    @html = html
  end

  def comments
    RDiscount.new(@comment.join, :smart, :filter_html).to_html
  end

  def html
    RDiscount.new(@html.join, :smart, :filter_html).to_html
  end
end
