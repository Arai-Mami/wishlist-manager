Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wishes, only: [:index, :new, :show, :create]
  resources :dones, only: [:index, :show, :create]
  root "wishes#index"
end
