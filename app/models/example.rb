require 'rdiscount'

class Example
  def initialize (comment)
    @comment = comment
  end

  def render
    RDiscount.new(strip_comment_marker(@comment)).to_html
  end

  private

  def strip_comment_marker(comment)
    comment.gsub("\n * ", "\n").gsub("\n *", "\n").strip
  end
end
