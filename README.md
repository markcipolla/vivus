# Vivus Styleguide

## Idea

Styleguides can be a pain to keep as a living documentation for your CSS.

By analysing the comments in your [SASS](http://sass-lang.com/) files, and by adding markdown to your stylesheets, you can generate a living, breathing documentation styleguide that has examples of how the CSS is used.

To get running, checkout the branch (it's still waaaay alpha) and add this to your Gemfile:
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
/*
[Name] The name of the component (e.g. Success Buttons)
[Section] A section that groups components together (e.g. Buttons)
[Description]

Write some documentation explaining the use / concept of the CSS
you've got below. This bit will be markdown rendered.

- You can use three backticks (`) to indicate a code block
- ```&lt;div class="example"&gt;&lt;/div&gt;```
- Code blocks will be syntax highlighted

When you've documented it nicely, use the Example markers to
indicate a block of HTML that uses the CSS.

Keeps your documentation right near the CSS.
So, if you update / refactor the CSS, update the HTML example if
need be.

[Example]
&lt;div class="example"&gt;
  &lt;a href="#" class="button"&gt;Some text&lt;a&gt;
&lt;/div&gt;
[Url] A web address pointing to further documentation / example (optional)
*/
```

This project rocks and uses MIT-LICENSE.
