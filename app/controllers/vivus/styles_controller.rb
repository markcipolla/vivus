# Controller for dsiplaying the documentation for the styles
class Vivus::StylesController < Vivus::ApplicationController
  before_filter :find_stylesheets

  def index
  end

  # def show
  #   @stylesheet = Stylesheet.new(path: "#{params[:path]}.#{params[:format]}")
  # end

  private

  def find_stylesheets
    sprockets = Rails.application.assets

    @css_paths = %w{application.css}
    @css_paths += Rails.application.config.assets.precompile.select { |item|
      item.is_a?(String) && item[-4,4] == ".css"
    }

    @stylesheets = @css_paths.map{|file_path| Stylesheet.new(css: sprockets[file_path].body)}
  end

  def is_a_file? file
    File.file?(file)
  end
end
