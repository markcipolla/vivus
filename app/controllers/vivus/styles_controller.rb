# Controller for dsiplaying the documentation for the styles
class Vivus::StylesController < Vivus::ApplicationController
  before_filter :find_stylesheets

  def index
  end

  def show
    @stylesheet = Stylesheet.new(path: "#{params[:path]}.#{params[:format]}")
  end

  private

  def find_stylesheets
    files = []
    extensions = ['**/*.sass', '**/*.scss']
    extensions.each do |extension|
      Dir.glob("app/assets/stylesheets/#{extension}") do |path|
        files << path if is_a_file?(path)
      end
    end

    @stylesheets = files.map{|file_path| Stylesheet.new(path: file_path)}
  end

  def is_a_file? file
    File.file?(file)
  end
end
