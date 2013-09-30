Vivus::Engine.routes.draw do
  mount Vivus::Engine, at: "vivus"

  root :to => "styles#index"
end
