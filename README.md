# Vivus Styleguide [<img src="https://travis-ci.org/markcipolla/vivus.svg?branch=master" />](https://travis-ci.org/markcipolla/vivus)&nbsp;[<img src="https://badge.fury.io/rb/vivus.svg" alt="Gem Version" height="18">](http://badge.fury.io/rb/vivus)

## Concept

Styleguides can be a pain to keep as a living documentation for your CSS.

The issue I had with various styleguide gems is that documenting your CSS in a not-hugely specific way is hard, and that keeping the HTML examples in another files means that there are three places your code needs to be updated and checked:

- In your CSS file,
- in your HTML Examples,
- and in the HTML that your app actually uses.

Too many times we'd had the styleguides become unusable as the HTML gets rewritten and the CSS updated.

By analysing the comments in your [SASS](http://sass-lang.com/) files, and by adding markdown to your stylesheets, you can generate a living, breathing documentation styleguide that has examples of how the CSS is used.

## Installation
Add this to your Gemfile:
```
gem 'vivus'
```

Add this to your routes.rb
```
if Rails.env.development?
  mount Vivus::Engine, at: "styleguide"
end
```

Then hit up ```localhost:3000/styleguide```

To document your CSS, use this as a template
```
/**
[Name] The name of the component (e.g. Success Buttons)
[Section] A section that groups components together (e.g. Buttons)
[Description]

Write some documentation explaining the use / concept of the CSS
you've got below. This bit will be markdown rendered.

This is optional, but really... why styleguide code you don't want 
to document?

- You can use three backticks (`) to indicate a code block
- ```<div class="example"></div>```
- Code blocks will be syntax highlighted

When you've documented it nicely, use the Example markers to
indicate a block of HTML that uses the CSS.

Keeps your documentation right near the CSS.
So, if you update / refactor the CSS, update the HTML example if
need be.

[Example] 
<div class="example">
  <p>This is optional, but kinda the point</p>
  <a href="#" class="button">Some text</a>
</div>

<% 5.times do %>
  <div class="example">
    <p>This will be outputted five times!</p>
    <p>ERB in your CSS! Craziness!</p>
  </div>
<% end %>
[Url] A web address pointing to further documentation / example (optional)
**/
```

The only required ones are ```[Name]``` and ```[Section]```. 
The rest are up to you to decide how much details you add.

This project rocks and uses MIT-LICENSE.
