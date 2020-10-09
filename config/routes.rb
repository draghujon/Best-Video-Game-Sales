Rails.application.routes.draw do
  get "publisher/index"
  get "/publisher/show/(:id)", to: "publisher#show", as: :publisher
  resources :pages
  get "/pages/:permalink" => "pages#permalink", as: :permalink
  get "genre/index"
  get "game/index"
  # get "game/show"
  get "/game/show/(:id)", to: "game#show", as: "game"
  # get "/genre/show/(:id)", to: "genre#show", as: "genre"
  # resources :games, only: %i[index show]
  resources :genre, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
