# Controller for dsiplaying the documentation for the styles
class Vivus::StylesController < Vivus::ApplicationController
  def index
    find_stylesheets
  end

  private

  def find_stylesheets
    directories = Rails.application.config.assets.paths.map{|path| path if path.match(/stylesheets$/) }.compact
  end
end