Rails.application.routes.draw do
  root to: 'folders#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'users/login_from_ext', to: 'users#login_from_ext'
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #   end
  # end
  resources :folders do
    resources :tabs, shallow: true
  end
  get 'auth/request', to:'users#google_oauth2'
  resources :tabs, only: [:index]
end
