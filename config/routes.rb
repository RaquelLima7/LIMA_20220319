Rails.application.routes.draw do
  root to: 'videos#index'
  post 'videos', to: 'videos#create'
  get 'videos/new', to: 'videos#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
