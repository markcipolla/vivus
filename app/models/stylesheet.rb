require 'yaml'


class Stylesheet
  def initialize(options)
    @css = options[:css]
  end

  def parse
    documentation = []

    styleguide_comment.each do |css|
      css = css[1]

      name = find_name_for(css)
      section = find_section_for(css)
      description = find_description_for(css)
      example = find_example_for(css)
      url = find_url_for(css)

      if name.present? || section.present? || description.present? || example.present? || url.present?
        component = Component.new

        component.name = name if name
        component.section = section if section
        component.description = description if description
        component.example = example if example
        component.url = url if url

        documentation << component
      end
    end
    documentation
  end

  private

  def find_name_for css
    regex = /\[Name\](.*?)$/m
    result = scan_css(css, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_section_for css
    regex = /\[Section\](.*?)\n/m
    result = scan_css(css, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_description_for css
    # scan_css(css, regex).first
  end

  def find_example_for css
    # scan_css(css, regex).first
  end

  def find_url_for css
    regex = /\[Url\](.*?)\n/m
    result = scan_css(css, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def styleguide_comment
    regex = /\/\*(.*?)\*\//m
    scan_css(@css, regex)
  end

  def scan_css text, regex
    text.to_enum(:scan, regex).map { Regexp.last_match }
  end
end
