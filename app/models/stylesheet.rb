class Stylesheet
  def initialize(options)
    @css = options[:css]
  end

  def parse
    documentation = []

    regex = /\/\* (Description|Example)(.*?) \*\//m
    matches = @css.to_enum(:scan, regex).map { Regexp.last_match }

    matches.each do |match|
      case match[1]
      when "Description"
         documentation << Description.new(match)
      when "Example"
         documentation << Example.new(match)
      end
    end

    documentation
  end
end
