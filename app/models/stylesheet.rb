require 'yaml'


class Stylesheet
  def initialize(options)
    @css = options[:css]
  end

  def parse
    documentation = []

    fields = ['Name', 'Section', 'Description', 'Example', 'Url']
    matches = []

    fields.each do |term|
      regex = /(- #{term})(.*?)(#{fields.collect{|field| "- #{field}"}.join("|")}|\*\/)/m

      matches << @css.to_enum(:scan, regex).map { Regexp.last_match }
    end

    unless matches.reject(&:empty?).present?
      matches.reject(&:empty?).each do |match|
        binding.pry
        case match[1]
        when "- Description"
           documentation << Description.new(match)
        when "- Example"
           documentation << Example.new(match)
        end
      end
    end

    documentation
  end

  # def parse
  #   documentation = []

  #   regex = /\/\* Styleguide(.*?)\*\//m
  #   matches = @css.to_enum(:scan, regex).map { Regexp.last_match }

  #   matches.each do |match|
  #     binding.pry
  #   end

  #   documentation
  # end
end
