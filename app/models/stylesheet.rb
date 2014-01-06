class Stylesheet
  def initialize(options)
    @path = options[:path]
  end

  def path
    @path
  end

  def body
    File.read(@path)
  end
end
