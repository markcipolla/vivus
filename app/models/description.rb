require 'rdiscount'

class Description
  def initialize (comment)
    @comment = comment
  end

  def render
    RDiscount.new(strip_comment_marker(@comment), :smart, :filter_html).to_html.html_safe
  end

  private

  def strip_comment_marker(comment)
    comment.gsub("\n * ", "\n").gsub("\n *", "\n").strip
  end
end
