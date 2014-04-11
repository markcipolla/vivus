require 'yaml'


class Stylesheet
  def initialize(options)
    @css = options[:css]
  end

  def parse
    documentation = []

    styleguide_comment.each do |comment|
      comment = comment[1]

      name = find_name_for(comment)
      section = find_section_for(comment)
      description = find_description_for(comment)
      example = find_example_for(comment)
      url = find_url_for(comment)

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

    group_by_section(documentation)
  end

  private

  def group_by_section documentation
    documentation.sort_by(&:section).group_by(&:section).each do |key, group|
      group.sort!{|a,b| a.name.downcase <=> b.name.downcase }.each{|item| puts item}
    end
  end

  def find_name_for comment
    regex = /\[Name\](.*?)(\[Section\]|\[Description\]|\[Example\]|\[Url\]|\*\/|\z)/m
    result = scan_comment(comment, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_section_for comment
    regex = /\[Section\](.*?)(\[Name\]|\[Description\]|\[Example\]|\[Url\]|\*\/|\z)/m
    result = scan_comment(comment, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_description_for comment
    regex = /\[Description\](.*?)(\[Name\]|\[Section\]|\[Example\]|\[Url\]|\*\/|\z)/m
    result = scan_comment(comment, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_example_for comment
    regex = /\[Example\](.*?)(\[Name\]|\[Section\]|\[Description\]|\[Url\]|\*\/|\z)/m
    result = scan_comment(comment, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def find_url_for comment
    regex = /\[Url\](.*?)(\[Name\]|\[Section\]|\[Description\]|\[Example\]|\*\/|\z)/m
    result = scan_comment(comment, regex)
    if result.present?
      result.first[1].strip
    end
  end

  def styleguide_comment
    regex = /\/\*(.*?)\*\//m
    scan_comment(@css, regex)
  end

  def scan_comment text, regex
    text.to_enum(:scan, regex).map { Regexp.last_match }
  end
end
