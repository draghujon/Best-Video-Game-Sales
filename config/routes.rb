Rails.application.routes.draw do
  # get "game/index"
  # get "game/show"
  # get "/game/show/(:id)", to: "game#show", as: "game"
  resources :games, only: %i[index show]
  # resources :genre, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
