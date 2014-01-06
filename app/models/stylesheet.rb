class Stylesheet
  def initialize(options)
    @path = options[:path]
  end

  def path
    @path
  end

  def display_path
    @path.gsub("app/assets/stylesheets/", "")
  end

  def body
    File.read(@path)
  end
end
