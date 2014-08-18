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
    @css_paths += Rails.application.config.assets.precompile.select do |item|
      item.is_a?(String) && item[-4,4] == ".css"
    end
    stylesheets = @css_paths.map{|file_path| Stylesheet.new(file_path: file_path, css: sprockets[file_path].body)}

    styleguide = Styleguide.new(stylesheets: stylesheets)
    @stylesheets = styleguide.generate
  end

  def is_a_file? file
    File.file?(file)
  end
end
