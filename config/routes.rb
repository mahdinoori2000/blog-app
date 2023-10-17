Rails.application.routes.draw do
  # get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"
  # Defines the root path route ("/")
  root "users#index"
  get '/users/:id', to: 'users#user'
  get '/users/:id/posts', to: 'users#posts'
  get 'users/:id/posts/:post_id', to: 'users#post'
end
