Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :wishes do
    get :complete
  end
  resources :dones, only: [:index, :show, :destroy]
  resources :small_steps, only: [:update]
  root "wishes#index"
end
