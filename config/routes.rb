Rails.application.routes.draw do
  root to: 'folders#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users/login_from_ext', to: 'users#login_from_ext'
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #   end
  # end
  resources :folders do
    resources :tabs
  end
  get 'auth/request', to:'users#google_oauth2'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
