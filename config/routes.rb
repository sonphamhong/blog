Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end
  resources :users
  resources :account_activations, only: [:edit]

  get 'password_reset/new'
  post 'password_reset/edit'
  root 'home#index'
  get 'login' => "session#new"
  post 'login' => "session#create"
  delete 'logout'=> "session#destroy"
  get 'signup' => "users#new"
  get 'like/:post_id' => 'users#like', as: "like"
  get 'unlike/:post_id' => 'users#unlike', as: "unlike"
  get "user/profile" => "users#show", as: "profile"
end
