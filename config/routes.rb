Rails.application.routes.draw do
  root to: "toppages#index"
  get 'battles/index'
  get 'battles/show'
  get 'battles/new'
  get 'battles/create'
  resources :battles, only: [:index, :show, :new, :create]
end
