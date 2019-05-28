Rails.application.routes.draw do
  resources :activities
  resources :milestones
  devise_for :users
  resources :contacts do
    resources :properties, shallow: true
  end

  resources :properties, only: [:index] do
    resources :deals, shallow: true
  end

  resources :deals, only: [:index]
  resources :users
  root 'welcome#index'
end