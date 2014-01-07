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

  def parse
    @blocks = []
    @source = @path
    @comment = []
    @html = []
    @in_a_comment = false
    @in_a_html_example = false

    File.readlines(@path).each do |line|
      # as long as the line starts with //, we're in a comment
      if line.start_with?("//")
        # If the comment begins with the Vivus mark
        if line.start_with?("// Vivus")
          @in_a_comment = true

        elsif line.start_with?("// HTML Example")

          if @in_a_html_example == false
            @in_a_html_example = true
          else
            @in_a_html_example = false
          end

        else

          if @in_a_html_example
            @html << line.gsub(/\/\/ /, '')
          else
            @comment << line.gsub(/\/\//, '')
          end

        end
      else
        # No longer in a comment
        if @in_a_comment
          @in_a_comment = false
          # if @source != nil && @comment != [] && @html != []
            @blocks << Block.new(@source, @comment.delete_if(&:empty?), @html.delete_if(&:empty?))

            @comment = []
            @html = []
          # end
        end
      end
    end

    @blocks
  end


end
