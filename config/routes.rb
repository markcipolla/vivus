Vivus::Engine.routes.draw do
  mount Vivus::Engine, at: "vivus"
  match "/*path", to: "styles#show"
  root to: "styles#index"
end
