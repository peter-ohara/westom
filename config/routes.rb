Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  root 'welcome#index'
end
