Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :events do
    post :register, on: :member
  end
  resources :attendees, only: [:index, :show, :destroy]
end
