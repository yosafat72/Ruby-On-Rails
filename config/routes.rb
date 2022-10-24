Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #User routes
  get 'users', to:'user#index'
  get 'users/:id', to:'user#show'
  post 'users', to:'user#create'
  put 'users/:id', to:'user#update'
  delete 'users/:id', to:'user#destroy'
end
