Vivus::Engine.routes.draw do
  # mount Vivus::Engine, at: "vivus"

  # I was using this to do a stylesheet 'show' action
  # It's a bit heavy-handed, and YAGNI atm.
  # match "/*path", to: "styles#show"

  root to: "styles#index"
end
