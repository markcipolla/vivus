Vivus::Engine.routes.draw do
  get '/:section', to: 'styles#show', as: "vivus_section"
  root to: "styles#index"
end
