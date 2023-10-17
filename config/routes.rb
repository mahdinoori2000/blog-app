Rails.application.routes.draw do
  # get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"
  # Defines the root path route ("/")
  root "users#index"
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:post_id', to: 'posts#show'
end
