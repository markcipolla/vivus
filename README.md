# Vivus Styleguide

## Idea

Styleguides can be a pain to keep as a living documentation for your CSS.

By analysing the comments in your [SASS](http://sass-lang.com/) files, and by adding markdown to your stylesheets, you can generate a living, breathing documentation styleguide that has examples of how the CSS is used.

To get running, checkout the branch (it's still waaaay alpha) and add this to your Gemfile:

```
gem 'vivus', path: "~/PATH/TO/vivus"
```

Add this to your routes.rb
```
if Rails.env.development?
  mount Vivus::Engine, at: "vivus"
end
```

Then hit up ```localhost:3000/vivus```

This project rocks and uses MIT-LICENSE.
