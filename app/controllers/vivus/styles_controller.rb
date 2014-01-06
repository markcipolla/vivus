# Controller for dsiplaying the documentation for the styles
class Vivus::StylesController < Vivus::ApplicationController
  def index
    find_stylesheets
  end

  private

  def find_stylesheets


    # root_assets_path = Rails.root + "app/assets/stylesheets"
    # extensions = ['**/*.css', '**/*.sass', '**/*.scss', '**/*.less']

    # Rails.application.assets.each_file do |pathname|
    #   pathname.dirname.to_s =~ /root_assets_path/
    #   files << pathname
    #   # pathname.include? extensions
    # end

    files = []
    extensions = ['**/*.css', '**/*.sass', '**/*.scss', '**/*.less']
    extensions.each do |extension|
      Dir.glob("app/assets/#{extension}") do |path|
        files << path if is_a_file?(path)
      end
    end

    @stylesheets = files.map{|file_path| Stylesheet.new(path: file_path)}
  end

  def is_a_file? file
    File.file?(file)
  end
end
