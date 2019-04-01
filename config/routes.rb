Rails.application.routes.draw do
  resources :contacts do
    resources :properties, shallow: true
  end
  resources :properties, only: [:index]
  resources :users
  root 'welcome#index'
end
