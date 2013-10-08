RominaBlog::Application.routes.draw do
  root 'landing#show'
  easy_auth_routes

  get  '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'
end
