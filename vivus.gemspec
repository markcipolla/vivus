$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vivus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vivus"
  s.version     = Vivus::VERSION
  s.authors     = ["Mark Cipolla"]
  s.email       = ["mark@markcipolla.com"]
  s.homepage    = "https://github.com/markcipolla/vivus"
  s.summary     = "Generates a styleguide for your SASS/SCSS"
  s.description = "Styleguides can be a pain to keep as a living documentation for your CSS. By analysing the comments in your SASS files, and by adding markdown to your stylesheets, you can generate a living, breathing documentation styleguide that has examples of how the CSS is used."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'rails', '~> 4.0', '>= 4.0.3'
  s.add_dependency "pry"
  s.add_dependency "better_errors"
end
