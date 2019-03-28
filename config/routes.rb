Rails.application.routes.draw do
  resources :contacts
  resources :users
  get 'welcome/index'

  root 'welcome#index'
end
