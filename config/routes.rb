RominaBlog::Application.routes.draw do
  root 'posts#index'
  easy_auth_routes

  get '/destroyed' => 'posts#destroyed'
  resources :posts do
    put 'restore'
    resources :comments
  end
  get  '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'
end
