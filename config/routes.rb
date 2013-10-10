RominaBlog::Application.routes.draw do
  root 'posts#index'
  easy_auth_routes

  resources :posts
  get  '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'
end
