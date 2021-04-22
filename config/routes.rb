Rails.application.routes.draw do
  root to: 'folders#index'
  # Devise routes for API clients (custom sessions controller)
  devise_scope :user do
    post 'api/v1/login', to: 'users/sessions#create'
    delete 'api/v1/logout', to: 'users/sessions#destroy'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'unsaved_tabs', to: 'tabs#unsaved_tabs'

  post 'users/login_from_ext', to: 'users#login_from_ext'
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #   end
  # end
  resources :folders do
    resources :tabs, shallow: true
    post "saveall", to: 'tabs#save_all', as: 'save_all'
    resources :shares, shallow: true
  end
  get 'auth/request', to:'users#google_oauth2'
  resources :tabs, only: [:index]
  get 'pages/home', to: 'pages#home'

  get 'folders/:id/like', to: 'folders#like', as: 'like_folder'
end
