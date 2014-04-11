require 'rdiscount'

class Component
  attr_accessor :name, :section, :description, :example, :url

  def display_description
    if self.description
      RDiscount.new(self.description, :smart, :filter_html).to_html.html_safe
    end
  end
end
