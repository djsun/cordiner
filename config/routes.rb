Cordiner::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  resource :random_data
  resources :projects
  resources :metrics

  root :to => 'dashboard#show'

end
