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
[Url] http://www.widgets.io
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
[Url] http://www.doodads.io
*/

.css_for_the_doodad {
  display: none;
}

/* Not a styleguide comment */

.some_other_css {
  display: none;
}

/*
[Name] CSS Foobar
[Section] Foobars
[Description]

## This is the third component

This is the description of the third component

TODO: Rewrite to be less, well... you get the idea.

[Example]
[Url] http://www.foobars.io
*/
eos
    end

    it "should return a hash" do
      Stylesheet.new(css: @css).parse.should be_kind_of(Hash)
    end

    it "should return a hash grouped by section" do
      stylesheet = Stylesheet.new(css: @css).parse

      stylesheet["Widgets and Doodads"].first.should be_kind_of(Component)
      stylesheet["Widgets and Doodads"].last.should be_kind_of(Component)
      stylesheet["Foobars"].first.should be_kind_of(Component)
    end

    it "should return a hash grouped by section, sorted by name" do
      stylesheet = Stylesheet.new(css: @css).parse

      stylesheet["Widgets and Doodads"].first.name.should == "CSS Doodad"
      stylesheet["Widgets and Doodads"].last.name.should == "CSS Widget"
      stylesheet["Foobars"].last.name.should == "CSS Foobar"
    end

    it "should returna hash grouped by section, sorted by nam, with data" do
      stylesheet = Stylesheet.new(css: @css).parse
      first_component = stylesheet["Widgets and Doodads"].first

      first_component.name.should == "CSS Doodad"
      first_component.section.should == "Widgets and Doodads"
      first_component.description.should == "## This is the second component\n\nThis is the description of the second component\n\nTODO: Rewrite widget to be more widget-ish"
      first_component.example.should == ""
      first_component.url.should == "http://www.doodads.io"
    end
  end
end
