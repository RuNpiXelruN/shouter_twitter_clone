Rails.application.routes.draw do
  root 'homes#show', via: :get
  resource :dashboard, only: :show
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create, :show]
  resources :photo_shouts, only: [:create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    post 'follow', to: 'following_relationships#create'
    delete 'follow', to: 'following_relationships#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
