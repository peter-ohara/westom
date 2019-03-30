Rails.application.routes.draw do
  resources :properties
  resources :contacts
  resources :users
  get 'welcome/index'

  root 'welcome#index'
end
