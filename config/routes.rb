Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wishes
  resources :dones, only: [:index, :show, :create]
  resources :small_steps, only: [:update]
  root "wishes#index"
end
