Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  match '/users/:verification_token', :to => 'users#confirm_email', via: [:post, :get]
  resources :users
  post '/auth/login', to: 'session#login'
  
end
