Rails.application.routes.draw do
  root to: "static#home"
  resources :users, except: :index 
  delete '/user/delete', to: 'users#destroy'
  get '/signin', to: 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
