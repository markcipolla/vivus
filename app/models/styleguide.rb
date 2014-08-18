# Takes a bunch of Stylesheets, parses them,
# and merges them into a single styleguide.
class Styleguide
  def initialize(options)
    @stylesheets = options[:stylesheets]
  end

  def generate
    @stylesheets
      .map{|stylesheet| stylesheet.parse}
      .reject{|stylesheet| stylesheet.empty?}
      .inject({}){ | accum, data |
        data.each do |section, components|
          accum[section] ||= []
          accum[section] += components
        end

        accum
      }
  end
end
