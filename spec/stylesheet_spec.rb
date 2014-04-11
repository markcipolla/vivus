require 'spec_helper'

describe Stylesheet do
  describe "#parse" do
    before do
      @css = <<-eos
/*
[Name] CSS Widget
[Section] Widgets and Doodads
[Description]

## This is the first component

This is the description of the first component

### Ideas

- Make more widgets
- ...
- Profit!

TODO: Rewrite widget to be more doodad-ish

[Example]
[Url] http://www.vivus.io
*/

.css_for_the_widget {
  display: none;
}

/*
[Name] CSS Doodad
[Section] Widgets and Doodads
[Description]

## This is the second component

This is the description of the second component

TODO: Rewrite widget to be more widget-ish

[Example]
[Url] http://www.vivus.io
*/

.css_for_the_doodad {
  display: none;
}

/* Not a styleguide comment */

.some_other_css {
  display: none;
}
eos
    end

    it "should return an array" do
      Stylesheet.new(css: @css).parse.should be_kind_of(Array)
    end

    it "should return an array of Components" do
      stylesheet = Stylesheet.new(css: @css).parse

      stylesheet[0].should be_kind_of(Component)
      stylesheet[1].should be_kind_of(Component)
    end

    it "should return an array of Components with data" do
      stylesheet = Stylesheet.new(css: @css).parse

      first_component = stylesheet.first
      first_component.name.should == "CSS Widget"
      first_component.section.should == "Widgets and Doodads"
      first_component.description.should == nil
      first_component.example.should == nil
      first_component.url.should == "http://www.vivus.io"
    end
  end
end
