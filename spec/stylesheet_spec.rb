require 'spec_helper'

describe Stylesheet do
  describe "#parse" do
    before do
      @css = <<-eos
/*
[Name] CSS Widget
[Section] Widgets and Doodads
[Description]

## Description of Widgets and Doodads

We have a bunch of widgets and doodads. This widget
includes the widgety goodness of widgets

### Ideas

- Make more widgets
- ...
- Profit!

TODO: Rewrite widget to be more doodad-ish

[Example]
[Url] http://www.vivus.io
*/
eos
    end

    it "should return a list of Component objects" do
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
