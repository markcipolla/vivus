require 'rdiscount'

class Component
  attr_accessor :name, :section, :description, :example, :url

  def display_description
    RDiscount.new(self.description, :smart, :filter_html).to_html.html_safe if self.description
  end

  def display_example
    ERB.new(example).result if self.example
  end
end
