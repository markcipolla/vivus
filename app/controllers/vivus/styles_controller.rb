# Controller for dsiplaying the documentation for the styles
class Vivus::StylesController < Vivus::ApplicationController
  def index
    gather_stylesheets
  end

  def show
    gather_stylesheets
  end

  private

  def gather_stylesheets
    sprockets = Rails.application.assets

    @css_paths = %w{application.css}
    @css_paths += Rails.application.config.assets.precompile.select { |item|
      item.is_a?(String) && item[-4,4] == ".css"
    }

    @stylesheets = @css_paths
      .map{|file_path| Stylesheet.new(css: sprockets[file_path].body)}
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

  def is_a_file? file
    File.file?(file)
  end
end
