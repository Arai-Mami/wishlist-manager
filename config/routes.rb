Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'wishes/done', to: 'wishes#done'
  resources :wishes, only: [:index, :new, :show]
  resources :dones, only: [:index, :show]
end
